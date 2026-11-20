import 'dart:ui' as ui;

import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/steps/step4_referral_code/step4_referral_code_model.dart'
    show kReferralRewardPoints;
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'refer_friend_model.dart';
export 'refer_friend_model.dart';

/// Shows the signed-in user's own referral code and lets them copy or share
/// it. A friend types this code on the "Do you have a referral code?" step
/// after signing up.
class ReferFriendWidget extends StatefulWidget {
  const ReferFriendWidget({super.key});

  static String routeName = 'ReferFriend';
  static String routePath = '/referFriend';

  static const String iosStoreUrl =
      'https://apps.apple.com/us/app/azyaa/id6743427685';
  static const String androidStoreUrl =
      'https://play.google.com/store/apps/details?id=com.azya.app';

  @override
  State<ReferFriendWidget> createState() => _ReferFriendWidgetState();
}

class _ReferFriendWidgetState extends State<ReferFriendWidget> {
  late ReferFriendModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReferFriendModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => _ensureCode());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  /// Accounts created before codes were issued have none, so make one the
  /// first time the screen is opened.
  Future<void> _ensureCode() async {
    final userRef = currentUserReference;
    if (userRef == null || _model.creatingCode) {
      return;
    }
    _model.creatingCode = true;
    safeSetState(() {});
    try {
      final user = await UsersRecord.getDocumentOnce(userRef);
      if (user.referralCode.isEmpty) {
        var code = '';
        for (var attempt = 0; attempt < 5; attempt++) {
          final candidate = random_data.randomString(8, 8, false, true, true);
          final taken = await queryUsersRecordCount(
            queryBuilder: (usersRecord) => usersRecord.where(
              'referral_code',
              isEqualTo: candidate,
            ),
          );
          if (taken == 0) {
            code = candidate;
            break;
          }
        }
        if (code.isNotEmpty) {
          await userRef.update(createUsersRecordData(referralCode: code));
        }
      }
    } catch (_) {
      // The screen shows a retry message when there is still no code.
    } finally {
      _model.creatingCode = false;
      safeSetState(() {});
    }
  }

  String _shareText(String code) =>
      FFLocalizations.of(context).getVariableText(
        enText: 'Join me on Azyaa. Use my referral code $code when you sign up.'
            '\n\niPhone: ${ReferFriendWidget.iosStoreUrl}'
            '\nAndroid: ${ReferFriendWidget.androidStoreUrl}',
        arText: 'انضم إليّ في أزياء. استخدم رمز الإحالة $code عند التسجيل.'
            '\n\nآيفون: ${ReferFriendWidget.iosStoreUrl}'
            '\nأندرويد: ${ReferFriendWidget.androidStoreUrl}',
      );

  Future<void> _copy(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            FFLocalizations.of(context).getVariableText(
              enText: 'Referral code copied',
              arText: 'تم نسخ رمز الإحالة',
            ),
            style: TextStyle(
              fontFamily: 'almarai',
              color: FlutterFlowTheme.of(context).info,
            ),
          ),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: FlutterFlowTheme.of(context).primary,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final l10n = FFLocalizations.of(context);

    return Title(
      title: 'ReferFriend',
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
                      enText: 'Refer a friend',
                      arText: 'ادعُ صديقاً',
                    ),
                    navigationIconStatus: true,
                    searchIconStatus: false,
                    wishlistIconStatus: false,
                    navigationFrom: 'referFriend',
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
          child: AuthUserStreamWidget(
            builder: (context) {
              final code = currentUserDocument?.referralCode ?? '';
              final points = currentUserDocument?.pointsBalance ?? 0;

              return SingleChildScrollView(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 16.0, 16.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.getVariableText(
                        enText: 'Share your code with friends',
                        arText: 'شارك رمزك مع أصدقائك',
                      ),
                      style: theme.titleMedium.override(
                        fontFamily: 'almarai',
                        color: theme.primaryText,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 8.0, 0.0, 20.0),
                      child: Text(
                        l10n.getVariableText(
                          enText:
                              'When a friend signs up and enters your code, you earn $kReferralRewardPoints reward points.',
                          arText:
                              'عندما يسجّل صديقك ويدخل رمزك، تحصل على $kReferralRewardPoints نقطة مكافأة.',
                        ),
                        style: theme.bodyMedium.override(
                          fontFamily: 'almarai',
                          color: theme.secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          lineHeight: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 20.0, 16.0, 20.0),
                      decoration: BoxDecoration(
                        color: theme.accent2,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.getVariableText(
                              enText: 'Your referral code',
                              arText: 'رمز الإحالة الخاص بك',
                            ),
                            style: theme.bodyMedium.override(
                              fontFamily: 'almarai',
                              color: theme.secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          if (code.isNotEmpty)
                            // Codes are Latin letters and digits, so keep them
                            // left-to-right in Arabic too.
                            Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: SelectableText(
                                code,
                                textAlign: TextAlign.center,
                                style: theme.headlineMedium.override(
                                  fontFamily: 'almarai',
                                  color: theme.primaryText,
                                  fontSize: 28.0,
                                  letterSpacing: 4.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          else if (_model.creatingCode)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      theme.primary),
                                ),
                              ),
                            )
                          else
                            InkWell(
                              onTap: _ensureCode,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Text(
                                  l10n.getVariableText(
                                    enText:
                                        'We could not load your code. Tap to try again.',
                                    arText:
                                        'تعذّر تحميل رمزك. اضغط للمحاولة مرة أخرى.',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: theme.bodyMedium.override(
                                    fontFamily: 'almarai',
                                    color: theme.error,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (code.isNotEmpty)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () => _copy(code),
                                text: l10n.getVariableText(
                                  enText: 'Copy code',
                                  arText: 'نسخ الرمز',
                                ),
                                icon: const Icon(Icons.copy, size: 18.0),
                                options: FFButtonOptions(
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                  iconColor: theme.primary,
                                  color: theme.primaryBackground,
                                  textStyle: theme.titleSmall.override(
                                    fontFamily: 'almarai',
                                    color: theme.primary,
                                    letterSpacing: 0.0,
                                  ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: theme.primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Builder(
                                builder: (buttonContext) => FFButtonWidget(
                                  onPressed: () async {
                                    await Share.share(
                                      _shareText(code),
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(buttonContext),
                                    );
                                  },
                                  text: l10n.getVariableText(
                                    enText: 'Share',
                                    arText: 'مشاركة',
                                  ),
                                  icon: const Icon(Icons.ios_share, size: 18.0),
                                  options: FFButtonOptions(
                                    height: 48.0,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                    iconColor: theme.info,
                                    color: theme.primary,
                                    textStyle: theme.titleSmall.override(
                                      fontFamily: 'almarai',
                                      color: theme.info,
                                      letterSpacing: 0.0,
                                    ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              l10n.getVariableText(
                                enText: 'Your reward points',
                                arText: 'نقاط المكافأة',
                              ),
                              style: theme.bodyLarge.override(
                                fontFamily: 'almarai',
                                color: theme.primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                            ),
                          ),
                          Text(
                            points.toString(),
                            style: theme.bodyLarge.override(
                              fontFamily: 'almarai',
                              color: theme.primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
