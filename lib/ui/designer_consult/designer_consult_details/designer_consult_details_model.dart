import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'designer_consult_details_widget.dart' show DesignerConsultDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DesignerConsultDetailsModel
    extends FlutterFlowModel<DesignerConsultDetailsWidget> {
  ///  Local state fields for this page.

  SessionListStruct? userSession;
  void updateUserSessionStruct(Function(SessionListStruct) updateFn) {
    updateFn(userSession ??= SessionListStruct());
  }

  SessionSlotStruct? userSlot;
  void updateUserSlotStruct(Function(SessionSlotStruct) updateFn) {
    updateFn(userSlot ??= SessionSlotStruct());
  }

  String sessionStatus = 'Show';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DesignerConsultDetails widget.
  SettingsRecord? settingsrslt1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  SettingsRecord? companyRslt1;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
