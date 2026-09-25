import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'step2_measurements_model.dart';
export 'step2_measurements_model.dart';

class Step2MeasurementsWidget extends StatefulWidget {
  const Step2MeasurementsWidget({super.key});

  static String routeName = 'Step2-Measurements';
  static String routePath = '/azyaa-step-two';

  @override
  State<Step2MeasurementsWidget> createState() =>
      _Step2MeasurementsWidgetState();
}

class _Step2MeasurementsWidgetState extends State<Step2MeasurementsWidget> {
  late Step2MeasurementsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step2MeasurementsModel());

    _model.hieghtTextController ??= TextEditingController();
    _model.hieghtFocusNode ??= FocusNode();

    _model.weightTextController ??= TextEditingController();
    _model.weightFocusNode ??= FocusNode();

    _model.chestTextController ??= TextEditingController();
    _model.chestFocusNode ??= FocusNode();

    _model.waistTextController ??= TextEditingController();
    _model.waistFocusNode ??= FocusNode();

    _model.hipTextController ??= TextEditingController();
    _model.hipFocusNode ??= FocusNode();

    _model.inseamTextController ??= TextEditingController();
    _model.inseamFocusNode ??= FocusNode();

    _model.shoulderTextController ??= TextEditingController();
    _model.shoulderFocusNode ??= FocusNode();

    _model.armTextController ??= TextEditingController();
    _model.armFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Step2-Measurements',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'swp3rzy6' /* 1 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'zf9dpcxu' /* 2 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'z5uowv7d' /* 3 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'x3omtdi1' /* We’ll create your perfect fit! */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'almarai',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'emoumv29' /* Share your measurements to hel... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'almarai',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: const BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/ChatGPT_Image_Apr_9,_2025_at_02_44_41_PM-Photoroom_1.png',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                fit: BoxFit.contain,
                                                alignment: const Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: const BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'gi7ttsfg' /* Height */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.hieghtTextController,
                                                                        focusNode:
                                                                            _model.hieghtFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .hieghtTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitHieghtValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitHieghtValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          'wfye8775' /* Cm */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '3j3n0xpx' /* Cm */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitHieghtValue = val),
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'mymvtu9z' /* Cm */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'nautychb' /* Weight */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.weightTextController,
                                                                        focusNode:
                                                                            _model.weightFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .weightTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitWeightValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitWeightValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          'gel79ib7' /* Kg */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'hskb9i4e' /* Kg */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitWeightValue = val),
                                                                      width:
                                                                          45.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '63lre1jp' /* Kg */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'or66bpq2' /* Bust / Chest */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.chestTextController,
                                                                        focusNode:
                                                                            _model.chestFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .chestTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitChestValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitChestValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          'abwmvr0f' /* Cm */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'z2n0d4ea' /* Cm */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitChestValue = val),
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'n6ykiit6' /* Cm */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'v8t44iud' /* Waist */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.waistTextController,
                                                                        focusNode:
                                                                            _model.waistFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .waistTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitWaistValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitWaistValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          '8jkgglej' /* Cm */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '3gur1lu9' /* Cm */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitWaistValue = val),
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'uoztgb5n' /* Cm */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '9ammd8ms' /* Hip */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.hipTextController,
                                                                        focusNode:
                                                                            _model.hipFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .hipTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitHipValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitHipValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          'yrsad3qc' /* Cm */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5ai6soqr' /* Cm */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitHipValue = val),
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'kwya9c08' /* Cm */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'e1ngr8nb' /* Inseam */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.inseamTextController,
                                                                        focusNode:
                                                                            _model.inseamFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .inseamTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitInseamValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitInseamValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          'roz9c7pu' /* Cm */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'lr3u0dky' /* Cm */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitInseamValue = val),
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '3qhfszjb' /* Cm */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'jl72de75' /* Shoulder Width */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.shoulderTextController,
                                                                        focusNode:
                                                                            _model.shoulderFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .shoulderTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitShoulderValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitShoulderValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          '09qo7b9t' /* Cm */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'sd5jxzqp' /* Cm */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitShoulderValue = val),
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'zn0p96mr' /* Cm */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'rryqt0e2' /* Arm Length */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          () {
                                                                        if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall) {
                                                                          return 70.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointMedium) {
                                                                          return 80.0;
                                                                        } else if (MediaQuery.sizeOf(context).width <
                                                                            kBreakpointLarge) {
                                                                          return 100.0;
                                                                        } else {
                                                                          return 100.0;
                                                                        }
                                                                      }(),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.armTextController,
                                                                        focusNode:
                                                                            _model.armFocusNode,
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.done,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              15.0,
                                                                              15.0,
                                                                              15.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLength:
                                                                            6,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        buildCounter: (context,
                                                                                {required currentLength,
                                                                                required isFocused,
                                                                                maxLength}) =>
                                                                            null,
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .armTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .unitArmValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model
                                                                            .unitArmValue ??= FFLocalizations.of(
                                                                                context)
                                                                            .getText(
                                                                          'njuyp9ze' /* Cm */,
                                                                        ),
                                                                      ),
                                                                      options: [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'lxmgm7e0' /* Cm */,
                                                                        )
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.unitArmValue = val),
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          30.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '5c8h1qnu' /* Cm */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          0.0,
                                                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 12.0))
                                                    .addToEnd(
                                                        const SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(const SizedBox(width: 12.0))
                                          .addToEnd(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          if (_model.hieghtTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill height field.',
                                      arText: 'يرجى ملء حقل الارتفاع.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                          } else if (_model.weightTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill weight field.',
                                      arText: 'يرجى ملء حقل الوزن.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                          } else if (_model.chestTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill chest field.',
                                      arText: 'من فضلك إملأ حقل الصدر.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                          } else if (_model.waistTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill waist field.',
                                      arText: 'من فضلك إملأ حقل الخصر.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                          } else if (_model.hipTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill hip field.',
                                      arText: 'من فضلك إملأ حقل الورك.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                          } else if (_model.inseamTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill inseam field.',
                                      arText: 'يرجى ملء حقل inseam.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                          } else if (_model.shoulderTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill shoulder field.',
                                      arText: 'من فضلك إملأ حقل الكتف.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                          } else if (_model.armTextController.text == '') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Please fill arm field.',
                                      arText: 'يرجى ملء حقل الذراع.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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

                          _model.idMapResult1 = await queryIdMapRecordOnce(
                            queryBuilder: (idMapRecord) => idMapRecord.where(
                              'type',
                              isEqualTo: 'Main',
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _shouldSetState = true;

                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              userInfo: createUserRelatedInfoStruct(
                                isStep2Status: true,
                                clearUnsetFields: false,
                              ),
                            ),
                            ...mapToFirestore(
                              {
                                'user_body': FieldValue.arrayUnion([
                                  getUserBodyFirestoreData(
                                    createUserBodyStruct(
                                      relationId:
                                          _model.idMapResult1?.relationId,
                                      userName: currentUserDisplayName,
                                      relationName: 'Self',
                                      bodyInfo: createUserBodyInfoStruct(
                                        measurementId:
                                            _model.idMapResult1?.measurementId,
                                        height: double.tryParse(
                                            _model.hieghtTextController.text),
                                        heightUnit: _model.unitHieghtValue,
                                        weight: double.tryParse(
                                            _model.weightTextController.text),
                                        weightUnit: _model.unitWeightValue,
                                        chest: double.tryParse(
                                            _model.chestTextController.text),
                                        chestUnit: _model.unitChestValue,
                                        waist: double.tryParse(
                                            _model.waistTextController.text),
                                        waistUnit: _model.unitWaistValue,
                                        hips: double.tryParse(
                                            _model.hipTextController.text),
                                        hipsUnit: _model.unitHipValue,
                                        inseam: double.tryParse(
                                            _model.inseamTextController.text),
                                        inseamUnit: _model.unitInseamValue,
                                        shoulderWidth: double.tryParse(
                                            _model.shoulderTextController.text),
                                        shoulderWidthUnit:
                                            _model.unitShoulderValue,
                                        armLength: double.tryParse(
                                            _model.armTextController.text),
                                        armLengthUnit: _model.unitArmValue,
                                        clearUnsetFields: false,
                                      ),
                                      isDefault: true,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });

                          await _model.idMapResult1!.reference.update({
                            ...mapToFirestore(
                              {
                                'measurement_id': FieldValue.increment(1),
                                'relation_id': FieldValue.increment(1),
                              },
                            ),
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Measurement saved',
                                  arText: 'تم حفظ القياس',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 1500),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );

                          context.goNamed(
                            Step3PreferredStyleWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'gcz0jz3y' /* Save & Continue */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          userInfo: createUserRelatedInfoStruct(
                            isStep2Status: true,
                            clearUnsetFields: false,
                          ),
                        ));

                        context.goNamed(
                          Step3PreferredStyleWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'r44ajkcf' /* Skip */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'almarai',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(height: 16.0))
                      .addToEnd(const SizedBox(height: 32.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
