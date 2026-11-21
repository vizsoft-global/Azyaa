// Tests for the designer application status (plan item "Enrollment
// (Designer)").
//
// Two halves, like the other tests here:
//   * a pure half for reading the application off the user record,
//   * a source half for the wiring: the profile has to show the status row
//     exactly when the "Become a designer" tile is hidden, or an applicant is
//     left with neither.
//
// Run with: flutter test test/designer_application_test.dart

import 'dart:io';

import 'package:azyaa/backend/designer/designer_application.dart';
import 'package:flutter_test/flutter_test.dart';

const String _profileFile =
    'lib/azyaa_group_a/customer/zone/profile/profile_widget.dart';
const String _statusFile =
    'lib/azyaa_group_b/designer/designer_form/designer_application_status/designer_application_status_widget.dart';
const String _navFile = 'lib/flutter_flow/nav/nav.dart';
const String _indexFile = 'lib/index.dart';
const String _uploadFile =
    'lib/azyaa_group_b/designer/designer_form/designer_form_upload/designer_form_upload_widget.dart';

String _read(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: '$path is missing');
  return file.readAsStringSync();
}

/// Stands in for a Firestore Timestamp, which also has a `toDate()`.
class _FakeTimestamp {
  _FakeTimestamp(this._date);
  final DateTime _date;
  DateTime toDate() => _date;
}

void main() {
  group('DesignerApplication.fromRequests', () {
    test('no record, or no status, means no application', () {
      for (final value in <Object?>[
        null,
        'Pending',
        <String, dynamic>{},
        <String, dynamic>{'status': ''},
        <String, dynamic>{'status': '   '},
        <String, dynamic>{'status': null},
        <String, dynamic>{'form_data': <String, dynamic>{}},
      ]) {
        final application = DesignerApplication.fromRequests(value);
        expect(application.state, DesignerApplicationState.none,
            reason: '$value');
        expect(application.showsStatus, isFalse);
        expect(application.canApplyAgain, isFalse);
      }
    });

    test('reads the status the app writes when the form is sent', () {
      final application = DesignerApplication.fromRequests(
        <String, dynamic>{
          'status': 'Pending',
          'is_designer_request_status': true,
        },
      );
      expect(application.state, DesignerApplicationState.pending);
      expect(application.showsStatus, isTrue);
      expect(application.canApplyAgain, isFalse);
    });

    test('reads what the admin panel writes on approve', () {
      final application = DesignerApplication.fromRequests(
        <String, dynamic>{'status': 'Approved'},
      );
      expect(application.state, DesignerApplicationState.approved);
      expect(application.showsStatus, isFalse);
      expect(application.canApplyAgain, isFalse);
    });

    test('reads what the admin panel writes on reject', () {
      final when = DateTime(2026, 11, 21, 10, 30);
      final application = DesignerApplication.fromRequests(
        <String, dynamic>{
          'status': 'Rejected',
          'reject_reason': ' Incomplete documents ',
          'reject_message': 'The licence photo is cut off.',
          'updated_at': _FakeTimestamp(when),
        },
      );
      expect(application.state, DesignerApplicationState.rejected);
      expect(application.rejectReason, 'Incomplete documents');
      expect(application.rejectMessage, 'The licence photo is cut off.');
      expect(application.updatedAt, when);
      expect(application.showsStatus, isTrue);
      expect(application.canApplyAgain, isTrue);
      expect(application.hasRejectDetails, isTrue);
    });

    test('status is matched whatever its case', () {
      expect(
        DesignerApplication.fromRequests({'status': 'approved'}).state,
        DesignerApplicationState.approved,
      );
      expect(
        DesignerApplication.fromRequests({'status': 'REJECTED'}).state,
        DesignerApplicationState.rejected,
      );
      expect(
        DesignerApplication.fromRequests({'status': ' pending '}).state,
        DesignerApplicationState.pending,
      );
    });

    test('a rejection with no reason is still a rejection', () {
      final application =
          DesignerApplication.fromRequests({'status': 'Rejected'});
      expect(application.state, DesignerApplicationState.rejected);
      expect(application.hasRejectDetails, isFalse);
      expect(application.canApplyAgain, isTrue);
    });

    test('an old reason does not show once the user has applied again', () {
      // Applying again writes status Pending and leaves the old reason in
      // the record.
      final application = DesignerApplication.fromRequests({
        'status': 'Pending',
        'reject_reason': 'Incomplete documents',
        'reject_message': 'The licence photo is cut off.',
      });
      expect(application.state, DesignerApplicationState.pending);
      expect(application.rejectReason, isEmpty);
      expect(application.rejectMessage, isEmpty);
    });

    test('a status this app does not know is shown as under review', () {
      final application =
          DesignerApplication.fromRequests({'status': 'On hold'});
      expect(application.state, DesignerApplicationState.pending);
      expect(application.canApplyAgain, isFalse);
    });

    test('values of the wrong type are ignored, not thrown on', () {
      final application = DesignerApplication.fromRequests({
        'status': 'Rejected',
        'reject_reason': 42,
        'reject_message': ['x'],
        'updated_at': 'yesterday',
      });
      expect(application.state, DesignerApplicationState.rejected);
      expect(application.rejectReason, isEmpty);
      expect(application.rejectMessage, isEmpty);
      expect(application.updatedAt, isNull);
    });

    test('accepts a DateTime as well as a Timestamp', () {
      final when = DateTime(2026, 1, 2);
      expect(
        DesignerApplication.fromRequests({
          'status': 'Pending',
          'updated_at': when,
        }).updatedAt,
        when,
      );
    });
  });

  group('wiring', () {
    test('the app still sends applications as Pending', () {
      // The status screen and the admin panel both key on this exact word.
      expect(_read(_uploadFile), contains("status: 'Pending',"));
    });

    test('the status screen is a signed-in route', () {
      final nav = _read(_navFile);
      expect(nav, contains('name: DesignerApplicationStatusWidget.routeName,'));
      final route = nav.substring(
        nav.indexOf('name: DesignerApplicationStatusWidget.routeName,'),
      );
      expect(
        route.substring(0, route.indexOf('FFRoute(')),
        contains('requireAuth: true,'),
      );
      expect(
        _read(_indexFile),
        contains('designer_application_status_widget.dart'),
      );
    });

    test('the status screen reads the reason fields off the raw record', () {
      final source = _read(_statusFile);
      expect(
        source,
        contains("currentUserDocument?.snapshotData['designer_requests']"),
      );
      expect(source, contains('DesignerFormWidget.routeName'));
      expect(source, contains('application.canApplyAgain'));
    });

    test('the profile shows the application row and opens the screen', () {
      final profile = _read(_profileFile);
      expect(profile, contains('DesignerApplication.fromRequests('));
      expect(profile, contains('.showsStatus'));
      expect(
        RegExp(r'DesignerApplicationStatusWidget\s*\.routeName')
            .hasMatch(profile),
        isTrue,
      );
    });
  });
}
