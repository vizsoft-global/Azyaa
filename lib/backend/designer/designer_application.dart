/// Where a designer application stands, read from the `designer_requests` map
/// on the user's own record.
///
/// The mobile app writes `status: 'Pending'` when the application is sent. The
/// admin panel then writes `'Approved'`, or `'Rejected'` together with
/// `reject_reason` (a choice from a list) and `reject_message` (free text).
/// Those two fields are not part of the generated struct in this app, so the
/// record is read as a plain map here.
enum DesignerApplicationState {
  /// No application has been sent.
  none,

  /// Sent, waiting for the Azyaa team.
  pending,

  approved,

  rejected,
}

class DesignerApplication {
  const DesignerApplication({
    required this.state,
    this.rejectReason = '',
    this.rejectMessage = '',
    this.updatedAt,
  });

  static const DesignerApplication empty =
      DesignerApplication(state: DesignerApplicationState.none);

  final DesignerApplicationState state;

  /// The reason the admin picked. Empty unless [state] is rejected.
  final String rejectReason;

  /// Extra detail the admin typed. Empty unless [state] is rejected.
  final String rejectMessage;

  /// When the status last changed, if the record says.
  final DateTime? updatedAt;

  /// Reads the `designer_requests` map of a user record.
  ///
  /// Status is matched without regard to case, because the admin panels have
  /// written both `Approved` and `approved` for the same thing elsewhere. A
  /// status this app does not know is treated as pending rather than as "no
  /// application": the user did apply, and offering the form again would let
  /// them overwrite an application that is being handled.
  factory DesignerApplication.fromRequests(Object? designerRequests) {
    if (designerRequests is! Map) {
      return empty;
    }
    final status = _text(designerRequests['status']).toLowerCase();
    if (status.isEmpty) {
      return empty;
    }
    final state = switch (status) {
      'approved' => DesignerApplicationState.approved,
      'rejected' || 'declined' => DesignerApplicationState.rejected,
      _ => DesignerApplicationState.pending,
    };
    final rejected = state == DesignerApplicationState.rejected;
    return DesignerApplication(
      state: state,
      rejectReason: rejected ? _text(designerRequests['reject_reason']) : '',
      rejectMessage: rejected ? _text(designerRequests['reject_message']) : '',
      updatedAt: _date(designerRequests['updated_at']),
    );
  }

  /// The profile shows a status row while an answer is awaited or was a no.
  bool get showsStatus =>
      state == DesignerApplicationState.pending ||
      state == DesignerApplicationState.rejected;

  /// Only a declined application may be sent again.
  bool get canApplyAgain => state == DesignerApplicationState.rejected;

  /// True when the admin gave any reason at all.
  bool get hasRejectDetails =>
      rejectReason.isNotEmpty || rejectMessage.isNotEmpty;

  static String _text(Object? value) => value is String ? value.trim() : '';

  /// Accepts a [DateTime], or a Firestore `Timestamp` (anything with a
  /// `toDate()`), without this file depending on Firestore.
  static DateTime? _date(Object? value) {
    if (value is DateTime) {
      return value;
    }
    if (value == null) {
      return null;
    }
    try {
      final converted = (value as dynamic).toDate();
      return converted is DateTime ? converted : null;
    } catch (_) {
      return null;
    }
  }
}
