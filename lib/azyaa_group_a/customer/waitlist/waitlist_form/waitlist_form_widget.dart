import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
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
import 'waitlist_form_model.dart';
export 'waitlist_form_model.dart';

class WaitlistFormWidget extends StatefulWidget {
  const WaitlistFormWidget({super.key});

  static String routeName = 'Waitlist_Form';
  static String routePath = '/azyaa-waitlist';

  @override
  State<WaitlistFormWidget> createState() => _WaitlistFormWidgetState();
}

class _WaitlistFormWidgetState extends State<WaitlistFormWidget> {
  late WaitlistFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitlistFormModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.phonenumberTextController ??= TextEditingController();
    _model.phonenumberFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

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
        title: 'Waitlist_Form',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).border,
                      borderRadius: 100.0,
                      buttonSize: 42.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.goNamed(WaitlistMainWidget.routeName);
                      },
                    ),
                  ],
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
            ),
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
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.none,
                            alignment: AlignmentDirectional(1.0, -1.0),
                            image: Image.asset(
                              'assets/images/Vector_(3).png',
                            ).image,
                          ),
                        ),
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
                                  borderRadius: BorderRadius.circular(8.0),
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
                                    '7nwzjr15' /* Join the Waitlist */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Aileron',
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
                                  FFLocalizations.of(context).getText(
                                    'uxntdqg1' /* Be the first to know when acce... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Aileron',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '9ezn0gzt' /* Name */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'onxjnykm' /* * */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  child: TextFormField(
                                    controller: _model.nameTextController,
                                    focusNode: _model.nameFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '26e09g7t' /* Enter your full name */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .nameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '7zvzbpb1' /* Phone Number */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '5bb15vey' /* * */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
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
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 52.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                        width: 1.0,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .countryListValueController ??=
                                                  FormFieldController<String>(
                                                _model.countryListValue ??=
                                                    'Kuwait',
                                              ),
                                              options: List<String>.from(functions
                                                  .getGCCCountryListWithTranslation(
                                                      'en')),
                                              optionLabels: functions
                                                  .getGCCCountryListWithTranslation(
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode),
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                      .countryListValue = val),
                                              width: double.infinity,
                                              height: 50.0,
                                              maxHeight: 250.0,
                                              searchHintTextStyle: TextStyle(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '7883iwtz' /* Please select... */,
                                              ),
                                              searchHintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6mzgxizh' /* Search... */,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 0.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      65.0, 4.0, 12.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Image.network(
                                              functions.getCountryFlag(
                                                  _model.countryListValue)!,
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
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        child: TextFormField(
                                          controller:
                                              _model.phonenumberTextController,
                                          focusNode:
                                              _model.phonenumberFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '26gw2itf' /* Enter your mobile number */,
                                            ),
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .border,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .border,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    68.0, 0.0, 0.0, 8.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLength: functions.getPhoneLength(
                                              _model.countryListValue),
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          keyboardType: TextInputType.phone,
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
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          functions.getDailCode(
                                              _model.countryListValue)!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'xcdew72b' /* Email */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '7d14qg1l' /* * */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  child: TextFormField(
                                    controller: _model.emailTextController,
                                    focusNode: _model.emailFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'yqz7uwc6' /* Enter your email */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .emailTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    _model.userused =
                                        await queryUsersRecordCount(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(Filter.or(
                                        Filter(
                                          'email',
                                          isEqualTo:
                                              _model.emailTextController.text,
                                        ),
                                        Filter(
                                          'phone_number',
                                          isEqualTo:
                                              '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                        ),
                                      )),
                                    );
                                    _shouldSetState = true;
                                    if (_model.userused == 0) {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) => e
                                          ..userWaitlistEmail =
                                              _model.emailTextController.text
                                          ..userWaitlistPhoneNumber =
                                              '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}'
                                          ..userPhoneNumber =
                                              '${_model.phonenumberTextController.text}'
                                          ..phoneNumberWithoutDailcode =
                                              '${functions.getDailCode(_model.countryListValue)}'
                                          ..phoneNumberCountry =
                                              _model.countryListValue,
                                      );
                                      _model.userWaiterResult1 =
                                          await queryUserWaitlistRecordOnce(
                                        queryBuilder: (userWaitlistRecord) =>
                                            userWaitlistRecord
                                                .where(
                                                  'user_info.email',
                                                  isEqualTo: _model
                                                      .emailTextController.text,
                                                )
                                                .where(
                                                  'user_info.phone_number',
                                                  isEqualTo:
                                                      '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      if (((_model.userWaiterResult1 != null) ==
                                              true) &&
                                          ((_model.userWaiterResult1?.status ==
                                                  'Pending') ||
                                              (_model.userWaiterResult1
                                                      ?.status ==
                                                  'Active'))) {
                                        context.goNamed(
                                          WaitlistSuccessWidget.routeName,
                                          queryParameters: {
                                            'waiterRef': serializeParam(
                                              _model
                                                  .userWaiterResult1?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        _model.userWaiterResult =
                                            await queryUserWaitlistRecordOnce(
                                          queryBuilder: (userWaitlistRecord) =>
                                              userWaitlistRecord
                                                  .where(
                                                    'user_info.email',
                                                    isEqualTo: _model
                                                        .emailTextController
                                                        .text,
                                                  )
                                                  .where(
                                                    'user_info.phone_number',
                                                    isEqualTo:
                                                        '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                  )
                                                  .where(
                                                    'status',
                                                    isEqualTo: 'Active',
                                                  )
                                                  .where(
                                                    'user_app_access_data.status',
                                                    isEqualTo: 'Pending',
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        if ((_model.userWaiterResult != null) ==
                                            true) {
                                          context.goNamed(
                                            WaitlistSuccessWidget.routeName,
                                            queryParameters: {
                                              'waiterRef': serializeParam(
                                                _model.userWaiterResult
                                                    ?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          _model.userWaiterResultEmail =
                                              await queryUserWaitlistRecordOnce(
                                            queryBuilder:
                                                (userWaitlistRecord) =>
                                                    userWaitlistRecord
                                                        .where(
                                                          'user_info.email',
                                                          isEqualTo: _model
                                                              .emailTextController
                                                              .text,
                                                        )
                                                        .where(
                                                          'status',
                                                          isEqualTo: 'Active',
                                                        )
                                                        .where(
                                                          'user_app_access_data.status',
                                                          isEqualTo: 'Pending',
                                                        ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          if ((_model.userWaiterResultEmail !=
                                                  null) ==
                                              true) {
                                            context.goNamed(
                                              WaitlistSuccessWidget.routeName,
                                              queryParameters: {
                                                'waiterRef': serializeParam(
                                                  _model.userWaiterResultEmail
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            _model.userWaiterResultPhone =
                                                await queryUserWaitlistRecordOnce(
                                              queryBuilder:
                                                  (userWaitlistRecord) =>
                                                      userWaitlistRecord
                                                          .where(
                                                            'user_info.phone_number',
                                                            isEqualTo:
                                                                '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                          )
                                                          .where(
                                                            'status',
                                                            isEqualTo: 'Active',
                                                          )
                                                          .where(
                                                            'user_app_access_data.status',
                                                            isEqualTo:
                                                                'Pending',
                                                          ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            if ((_model.userWaiterResultPhone !=
                                                    null) ==
                                                true) {
                                              context.goNamed(
                                                WaitlistSuccessWidget.routeName,
                                                queryParameters: {
                                                  'waiterRef': serializeParam(
                                                    _model.userWaiterResultPhone
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          }
                                        }

                                        _model.idMapWaitlistResult =
                                            await queryIdMapRecordOnce(
                                          queryBuilder: (idMapRecord) =>
                                              idMapRecord.where(
                                            'type',
                                            isEqualTo: 'Main',
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;

                                        var userWaitlistRecordReference =
                                            UserWaitlistRecord.collection.doc();
                                        await userWaitlistRecordReference
                                            .set(createUserWaitlistRecordData(
                                          status: 'Pending',
                                          createdAt: getCurrentTimestamp,
                                          updatedAt: getCurrentTimestamp,
                                          userWaitlistId: _model
                                              .idMapWaitlistResult
                                              ?.userWaitlistId,
                                          userInfo: updateUserInfoStruct(
                                            UserInfoStruct(
                                              name: _model
                                                  .nameTextController.text,
                                              email: _model
                                                  .emailTextController.text,
                                              phoneNumber:
                                                  '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                              country: _model.countryListValue,
                                              phoneNumberWithoutDailcode: _model
                                                  .phonenumberTextController
                                                  .text,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ));
                                        _model.newUserWaiterResult =
                                            UserWaitlistRecord
                                                .getDocumentFromData(
                                                    createUserWaitlistRecordData(
                                                      status: 'Pending',
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                      updatedAt:
                                                          getCurrentTimestamp,
                                                      userWaitlistId: _model
                                                          .idMapWaitlistResult
                                                          ?.userWaitlistId,
                                                      userInfo:
                                                          updateUserInfoStruct(
                                                        UserInfoStruct(
                                                          name: _model
                                                              .nameTextController
                                                              .text,
                                                          email: _model
                                                              .emailTextController
                                                              .text,
                                                          phoneNumber:
                                                              '${functions.getDailCode(_model.countryListValue)}${_model.phonenumberTextController.text}',
                                                          country: _model
                                                              .countryListValue,
                                                          phoneNumberWithoutDailcode:
                                                              _model
                                                                  .phonenumberTextController
                                                                  .text,
                                                        ),
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                    ),
                                                    userWaitlistRecordReference);
                                        _shouldSetState = true;
                                        FFAppState().updateUserDataFlowStruct(
                                          (e) => e
                                            ..userWaitlistId = _model
                                                .idMapWaitlistResult
                                                ?.userWaitlistId,
                                        );

                                        await _model
                                            .idMapWaitlistResult!.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'user_waitlist_id':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                        _model.adminCount =
                                            FFAppState().adminUsersRefs.length;
                                        while (_model.adminCount! > 0) {
                                          _model.idmapresult3 =
                                              await queryIdMapRecordOnce(
                                            queryBuilder: (idMapRecord) =>
                                                idMapRecord.where(
                                              'type',
                                              isEqualTo: 'Main',
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;

                                          await NotificationRecord.collection
                                              .doc()
                                              .set(createNotificationRecordData(
                                                notificationId: _model
                                                    .idmapresult3
                                                    ?.notificationId
                                                    ?.toString(),
                                                createdAt: getCurrentTimestamp,
                                                updatedAt: getCurrentTimestamp,
                                                notificationType:
                                                    'waitlistrequest',
                                                messageType: 'WAITLIST REQUEST',
                                                message:
                                                    'New User Waiting to Register requested from ${_model.newUserWaiterResult?.userInfo?.name} || ${_model.newUserWaiterResult?.userWaitlistId?.toString()}',
                                                sentFrom: 'system',
                                                markAsRead: false,
                                                toUserRef: FFAppState()
                                                    .adminUsersRefs
                                                    .elementAtOrNull(
                                                        (_model.adminCount!) -
                                                            1),
                                              ));

                                          await _model.idmapresult3!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'notification_id':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });
                                          _model.adminCount =
                                              _model.adminCount! + -1;
                                        }

                                        context.goNamed(
                                          WaitlistSuccessWidget.routeName,
                                          queryParameters: {
                                            'waiterRef': serializeParam(
                                              _model.newUserWaiterResult
                                                  ?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText:
                                                    'Email or Phonenumber is already used !',
                                                arText:
                                                    'تم استخدام البريد الإلكتروني أو رقم الهاتف بالفعل!',
                                              )),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    enText: 'Ok',
                                                    arText: 'نعم',
                                                  )),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'u0zrje54' /* Join Now & Get Your Spot */,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Aileron',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.goNamed(
                                        WaitlistSecretWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'vlqszub7' /* I have invite code */,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Aileron',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
