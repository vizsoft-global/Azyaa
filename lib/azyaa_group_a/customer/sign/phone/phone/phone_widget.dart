import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'phone_model.dart';
export 'phone_model.dart';

class PhoneWidget extends StatefulWidget {
  const PhoneWidget({super.key});

  static String routeName = 'Phone';
  static String routePath = '/azyaa-phone';

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  late PhoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneModel());

    _model.phonenumberTextController ??= TextEditingController();
    _model.phonenumberFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Phone',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: StreamBuilder<List<SettingsRecord>>(
                          stream: querySettingsRecord(
                            queryBuilder: (settingsRecord) =>
                                settingsRecord.where(
                              'type',
                              isEqualTo: 'Main',
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 1.0,
                                  height: 1.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<SettingsRecord> containerSettingsRecordList =
                                snapshot.data!;
                            final containerSettingsRecord =
                                containerSettingsRecordList.isNotEmpty
                                    ? containerSettingsRecordList.first
                                    : null;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/logo.svg',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'q62fzdp0' /* Phone */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: Text(
                                        () {
                                          if (containerSettingsRecord
                                                  ?.settingsOtpService ==
                                              'firebase') {
                                            return FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'Please enter your Phone number to get OTP',
                                              arText:
                                                  'الرجاء إدخال رقم هاتفك للحصول على OTP',
                                            );
                                          } else if (containerSettingsRecord
                                                  ?.settingsOtpService ==
                                              'otpless') {
                                            return FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'Please enter your Whatsapp number to get OTP',
                                              arText:
                                                  'الرجاء إدخال رقم الواتساب الخاص بك للحصول على OTP',
                                            );
                                          } else {
                                            return FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'Please enter your Phone number to get OTP',
                                              arText:
                                                  'الرجاء إدخال رقم هاتفك للحصول على OTP',
                                            );
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .border,
                                              width: 1.0,
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .countryListValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.countryListValue ??=
                                                          valueOrDefault<
                                                              String>(
                                                        FFAppState()
                                                            .UserDataFlow
                                                            .phoneNumberCountry,
                                                        'Kuwait',
                                                      ),
                                                    ),
                                                    options: functions
                                                        .getCountrList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .countryListValue =
                                                          val);
                                                      safeSetState(() {
                                                        _model
                                                            .phonenumberTextController
                                                            ?.clear();
                                                      });
                                                    },
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    maxHeight: 250.0,
                                                    searchHintTextStyle:
                                                        TextStyle(
                                                      fontFamily: 'Aileron',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                    searchTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'almarai',
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'bvfgbu54' /* Please select... */,
                                                    ),
                                                    searchHintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '4w0yk5w9' /* Search... */,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(65.0, 4.0,
                                                                12.0, 4.0),
                                                    hidesUnderline: true,
                                                    isOverButton: true,
                                                    isSearchable: true,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Image.network(
                                                    functions.getCountryFlag(
                                                        _model
                                                            .countryListValue)!,
                                                    width: 35.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .phonenumberTextController,
                                                focusNode:
                                                    _model.phonenumberFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0x50acbx' /* Enter your mobile number */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(68.0, 0.0,
                                                              0.0, 8.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: functions
                                                    .getPhoneLength(_model
                                                        .countryListValue),
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.phone,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .phonenumberTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                '+${functions.getDailCode(_model.countryListValue)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          _model.userPhoneRegisteredValidation =
                                              await queryUsersRecordOnce(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord
                                                    .where(
                                                      'user_info.phone_number',
                                                      isEqualTo:
                                                          '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                    )
                                                    .where(
                                                      'phone_number',
                                                      isEqualTo:
                                                          '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                    )
                                                    .where(
                                                      'user_info.is_phone_verification_status',
                                                      isEqualTo: true,
                                                    ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if ((_model.userPhoneRegisteredValidation !=
                                                  null) ==
                                              true) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        '${FFLocalizations.of(context).getVariableText(
                                                      enText:
                                                          'Another account has already been registered using ',
                                                      arText:
                                                          'تم تسجيل حساب آخر باستخدام',
                                                    )}${'${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}'}'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText: 'okay',
                                                          arText: 'تمام',
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            safeSetState(() {
                                              _model.phonenumberTextController
                                                  ?.clear();
                                            });
                                          } else {
                                            _model.settingsResultPhoneOtpType =
                                                await querySettingsRecordOnce(
                                              queryBuilder: (settingsRecord) =>
                                                  settingsRecord.where(
                                                'type',
                                                isEqualTo: 'Company',
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            if (_model
                                                    .settingsResultPhoneOtpType
                                                    ?.settingsOtpService ==
                                                'firebase') {
                                              FFAppState()
                                                  .updateUserDataFlowStruct(
                                                (e) => e
                                                  ..userPhoneNumber =
                                                      '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}'
                                                  ..userPhoneOtpAttempt = 1
                                                  ..phoneNumberCountry =
                                                      _model.countryListValue
                                                  ..phoneNumberDailcode =
                                                      functions.getDailCode(
                                                          _model
                                                              .countryListValue)
                                                  ..phoneNumberWithoutDailcode =
                                                      _model
                                                          .phonenumberTextController
                                                          .text
                                                  ..phoneNumberDailcodeWithPlus =
                                                      functions.getDialCodeWithPlus(
                                                          _model
                                                              .countryListValue),
                                              );
                                              final phoneNumberVal =
                                                  '${functions.getDialCodeWithPlus(_model.countryListValue)}${_model.phonenumberTextController.text}';
                                              if (phoneNumberVal == null ||
                                                  phoneNumberVal.isEmpty ||
                                                  !phoneNumberVal
                                                      .startsWith('+')) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'gen42piv' /* Phone number required and has ... */,
                                                    )),
                                                  ),
                                                );
                                                return;
                                              }
                                              await authManager.beginPhoneAuth(
                                                context: context,
                                                phoneNumber: phoneNumberVal,
                                                onCodeSent: (context) async {
                                                  context.goNamedAuth(
                                                    PhoneVerificationWidget
                                                        .routeName,
                                                    context.mounted,
                                                    ignoreRedirect: true,
                                                  );
                                                },
                                              );
                                            } else {
                                              if (_model
                                                      .settingsResultPhoneOtpType
                                                      ?.settingsOtpService ==
                                                  'otpless') {
                                                if (_model
                                                        .settingsResultPhoneOtpType
                                                        ?.settingsCompanyInfo
                                                        ?.phoneOtpType ==
                                                    'SMS') {
                                                  _model.otpSmsSendApiStatus =
                                                      await OTPlessGroup
                                                          .sendSMSCall
                                                          .call(
                                                    phoneno:
                                                        '${functions.getDialCodeWithPlus(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                    url: isWeb
                                                        ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                                                        : 'https://nocodeplayground.onrender.com/',
                                                  );

                                                  if ((_model
                                                          .otpSmsSendApiStatus
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState()
                                                        .updateUserDataFlowStruct(
                                                      (e) => e
                                                        ..userPhoneNumber =
                                                            '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}'
                                                        ..userPhoneOtpAttempt =
                                                            1
                                                        ..phoneNumberCountry =
                                                            _model
                                                                .countryListValue
                                                        ..phoneNumberDailcode =
                                                            functions.getDailCode(
                                                                _model
                                                                    .countryListValue)
                                                        ..userPhoneOtpOrderId =
                                                            OTPlessGroup
                                                                .sendSMSCall
                                                                .requestId(
                                                          (_model.otpSmsSendApiStatus
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ..phoneNumberWithoutDailcode =
                                                            _model
                                                                .phonenumberTextController
                                                                .text
                                                        ..phoneNumberDailcodeWithPlus =
                                                            functions
                                                                .getDialCodeWithPlus(
                                                                    _model
                                                                        .countryListValue),
                                                    );

                                                    context.goNamed(
                                                      PhoneVerificationWidget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText:
                                                                '23There was a technical problem sending the OTP; please try again later. Also please check your mobile number again.',
                                                            arText:
                                                                'حدثت مشكلة فنية أثناء إرسال كلمة المرور لمرة واحدة (OTP)؛ يُرجى المحاولة لاحقًا. يُرجى أيضًا التحقق من رقم هاتفك المحمول مرة أخرى.',
                                                          ),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  _model.otpSendApiStatus =
                                                      await OTPlessGroup
                                                          .sendCall
                                                          .call(
                                                    phoneno:
                                                        '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                    url: isWeb
                                                        ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                                                        : 'https://nocodeplayground.onrender.com/',
                                                  );

                                                  if ((_model.otpSendApiStatus
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState()
                                                        .updateUserDataFlowStruct(
                                                      (e) => e
                                                        ..userPhoneNumber =
                                                            '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}'
                                                        ..userPhoneOtpAttempt =
                                                            1
                                                        ..phoneNumberCountry =
                                                            _model
                                                                .countryListValue
                                                        ..phoneNumberDailcode =
                                                            functions.getDailCode(
                                                                _model
                                                                    .countryListValue)
                                                        ..userPhoneOtpOrderId =
                                                            OTPlessGroup
                                                                .sendCall
                                                                .orderId(
                                                          (_model.otpSendApiStatus
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ..phoneNumberWithoutDailcode =
                                                            _model
                                                                .phonenumberTextController
                                                                .text
                                                        ..phoneNumberDailcodeWithPlus =
                                                            functions
                                                                .getDialCodeWithPlus(
                                                                    _model
                                                                        .countryListValue),
                                                    );

                                                    context.goNamed(
                                                      PhoneVerificationWidget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText:
                                                                'Please check your mobile number again.',
                                                            arText:
                                                                'يرجى التحقق من رقم هاتفك المحمول مرة أخرى.',
                                                          ),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }
                                                }
                                              }
                                            }
                                          }

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'fjuv54hn' /* Get OTP */,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 24.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'wv2sht0a' /* By continuing you agree  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.5,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'b25w6t4a' /* Terms of Services  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          letterSpacing: 0.5,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        context.pushNamed(
                                                          TermsWidget.routeName,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ai23awpj' /* &  */,
                                                ),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'lg2cw4ee' /* Privacy Policy  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          letterSpacing: 0.5,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        context.pushNamed(
                                                          PrivacyPolicyWidget
                                                              .routeName,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'almarai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 24.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                              LoginWidget.routeName,
                                              context.mounted,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'jnflpsmp' /* Already have an account ?  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        letterSpacing: 0.5,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'f5mgkgtl' /* Login */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        letterSpacing: 0.5,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
