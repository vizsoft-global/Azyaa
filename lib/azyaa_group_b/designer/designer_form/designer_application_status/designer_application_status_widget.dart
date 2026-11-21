import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/backend/designer/designer_application.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'designer_application_status_model.dart';
export 'designer_application_status_model.dart';

/// Tells a customer where their designer application stands: waiting for
/// review, approved, or declined with the reason the Azyaa team gave. A
/// declined application can be sent again from here.
///
/// Before this screen the "Become a designer" tile simply vanished from the
/// profile once the form was sent, and a declined applicant was never told.
class DesignerApplicationStatusWidget extends StatefulWidget {
  const DesignerApplicationStatusWidget({super.key});

  static String routeName = 'DesignerApplicationStatus';
  static String routePath = '/designerApplicationStatus';

  @override
  State<DesignerApplicationStatusWidget> createState() =>
      _DesignerApplicationStatusWidgetState();
}

class _DesignerApplicationStatusWidgetState
    extends State<DesignerApplicationStatusWidget> {
  late DesignerApplicationStatusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesignerApplicationStatusModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final l10n = FFLocalizations.of(context);

    return Title(
      title: 'DesignerApplicationStatus',
      color: theme.primary.withAlpha(0XFF),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: theme.primaryBackground,
            automaticallyImplyLeading: false,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.universalAppBarModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: UniversalAppBarWidget(
                    backButtonStatus: true,
                    title: l10n.getVariableText(
                      enText: 'Designer application',
                      arText: 'طلب المصمم',
                    ),
                    navigationIconStatus: true,
                    searchIconStatus: false,
                    wishlistIconStatus: false,
                    navigationFrom: 'designerApplicationStatus',
                    tryonStatus: false,
                    shareIconStatus: false,
                  ),
                ),
              ],
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          // The user record is a live stream, so an answer from the admin
          // panel shows here without leaving the screen.
          child: AuthUserStreamWidget(
            builder: (context) {
              final application = DesignerApplication.fromRequests(
                currentUserDocument?.snapshotData['designer_requests'],
              );
              return SingleChildScrollView(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 24.0, 16.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _content(context, application),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _content(BuildContext context, DesignerApplication application) {
    final theme = FlutterFlowTheme.of(context);
    final l10n = FFLocalizations.of(context);

    final (IconData icon, Color tint, String title, String body) =
        switch (application.state) {
      DesignerApplicationState.pending => (
          Icons.hourglass_top_rounded,
          theme.primary,
          l10n.getVariableText(
            enText: 'Your application is being reviewed',
            arText: 'طلبك قيد المراجعة',
          ),
          l10n.getVariableText(
            enText: 'We have received your designer application. The Azyaa '
                'team reviews every application, and you will get a '
                'notification as soon as there is an answer.',
            arText: 'لقد استلمنا طلبك للانضمام كمصمم. يراجع فريق أزياء كل '
                'طلب، وسيصلك إشعار فور صدور الرد.',
          ),
        ),
      DesignerApplicationState.rejected => (
          Icons.info_outline_rounded,
          theme.error,
          l10n.getVariableText(
            enText: 'Your application was not approved',
            arText: 'لم تتم الموافقة على طلبك',
          ),
          l10n.getVariableText(
            enText: 'You can correct what is listed below and apply again.',
            arText: 'يمكنك تصحيح ما ورد أدناه وتقديم الطلب من جديد.',
          ),
        ),
      DesignerApplicationState.approved => (
          Icons.verified_rounded,
          theme.success,
          l10n.getVariableText(
            enText: 'You are an Azyaa designer',
            arText: 'أنت الآن مصمم في أزياء',
          ),
          l10n.getVariableText(
            enText: 'Your application was approved. Welcome to Azyaa.',
            arText: 'تمت الموافقة على طلبك. أهلاً بك في أزياء.',
          ),
        ),
      DesignerApplicationState.none => (
          Icons.brush_outlined,
          theme.secondaryText,
          l10n.getVariableText(
            enText: 'You have not applied yet',
            arText: 'لم تقدّم طلباً بعد',
          ),
          l10n.getVariableText(
            enText: 'Apply to sell your designs on Azyaa.',
            arText: 'قدّم طلباً لبيع تصاميمك على أزياء.',
          ),
        ),
    };

    final updatedAt = application.updatedAt;

    return [
      Icon(icon, color: tint, size: 56.0),
      const SizedBox(height: 16.0),
      Text(
        title,
        textAlign: TextAlign.center,
        style: theme.titleMedium.override(
          fontFamily: 'almarai',
          color: theme.primaryText,
          fontSize: 20.0,
          letterSpacing: 0.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8.0),
      Text(
        body,
        textAlign: TextAlign.center,
        style: theme.bodyMedium.override(
          fontFamily: 'almarai',
          color: theme.secondaryText,
          fontSize: 14.0,
          letterSpacing: 0.0,
          lineHeight: 1.5,
        ),
      ),
      if (application.state == DesignerApplicationState.rejected) ...[
        const SizedBox(height: 24.0),
        Container(
          key: const ValueKey('designer-application-reason'),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: theme.alternate),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.getVariableText(
                  enText: 'Reason',
                  arText: 'السبب',
                ),
                style: theme.bodySmall.override(
                  fontFamily: 'almarai',
                  color: theme.secondaryText,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6.0),
              if (application.rejectReason.isNotEmpty)
                Text(
                  application.rejectReason,
                  style: theme.bodyMedium.override(
                    fontFamily: 'almarai',
                    color: theme.primaryText,
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (application.rejectMessage.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(
                    top: application.rejectReason.isNotEmpty ? 6.0 : 0.0,
                  ),
                  child: Text(
                    application.rejectMessage,
                    style: theme.bodyMedium.override(
                      fontFamily: 'almarai',
                      color: theme.primaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      lineHeight: 1.5,
                    ),
                  ),
                ),
              if (!application.hasRejectDetails)
                Text(
                  l10n.getVariableText(
                    enText: 'No reason was given. Contact Azyaa support if '
                        'you would like to know more.',
                    arText: 'لم يُذكر سبب. تواصل مع دعم أزياء إذا رغبت في '
                        'معرفة المزيد.',
                  ),
                  style: theme.bodyMedium.override(
                    fontFamily: 'almarai',
                    color: theme.primaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    lineHeight: 1.5,
                  ),
                ),
            ],
          ),
        ),
      ],
      if (updatedAt != null && application.showsStatus) ...[
        const SizedBox(height: 16.0),
        Text(
          l10n.getVariableText(
            enText: 'Last updated ${dateTimeFormat(
              'd MMM y',
              updatedAt,
              locale: l10n.languageCode,
            )}',
            arText: 'آخر تحديث ${dateTimeFormat(
              'd MMM y',
              updatedAt,
              locale: l10n.languageCode,
            )}',
          ),
          textAlign: TextAlign.center,
          style: theme.bodySmall.override(
            fontFamily: 'almarai',
            color: theme.secondaryText,
            fontSize: 12.0,
            letterSpacing: 0.0,
          ),
        ),
      ],
      const SizedBox(height: 32.0),
      if (application.canApplyAgain ||
          application.state == DesignerApplicationState.none)
        FFButtonWidget(
          key: const ValueKey('designer-application-apply'),
          onPressed: () async {
            context.pushNamed(
              DesignerFormWidget.routeName,
              extra: <String, dynamic>{
                '__transition_info__': const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          },
          text: application.canApplyAgain
              ? l10n.getVariableText(
                  enText: 'Apply again',
                  arText: 'قدّم الطلب من جديد',
                )
              : l10n.getVariableText(
                  enText: 'Apply now',
                  arText: 'قدّم الآن',
                ),
          options: FFButtonOptions(
            width: double.infinity,
            height: 48.0,
            color: theme.primary,
            textStyle: theme.titleSmall.override(
              fontFamily: 'almarai',
              color: Colors.white,
              fontSize: 15.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
            ),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
    ];
  }
}
