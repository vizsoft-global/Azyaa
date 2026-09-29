import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'creator_form_widget.dart' show CreatorFormWidget;
import 'package:flutter/material.dart';

class CreatorFormModel extends FlutterFlowModel<CreatorFormWidget> {
  ///  Local state fields for this page.

  String photoUploadStatus = 'notYet';

  List<String> thumbnailImages = [];
  void addToThumbnailImages(String item) => thumbnailImages.add(item);
  void removeFromThumbnailImages(String item) => thumbnailImages.remove(item);
  void removeAtIndexFromThumbnailImages(int index) =>
      thumbnailImages.removeAt(index);
  void insertAtIndexInThumbnailImages(int index, String item) =>
      thumbnailImages.insert(index, item);
  void updateThumbnailImagesAtIndex(int index, Function(String) updateFn) =>
      thumbnailImages[index] = updateFn(thumbnailImages[index]);

  List<String> styles = [];
  void addToStyles(String item) => styles.add(item);
  void removeFromStyles(String item) => styles.remove(item);
  void removeAtIndexFromStyles(int index) => styles.removeAt(index);
  void insertAtIndexInStyles(int index, String item) =>
      styles.insert(index, item);
  void updateStylesAtIndex(int index, Function(String) updateFn) =>
      styles[index] = updateFn(styles[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  bool isDataUploading_uploadDataWvr134 = false;
  FFUploadedFile uploadedLocalFile_uploadDataWvr134 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataWvr134 = '';

  // State field(s) for Fullname-field widget.
  FocusNode? fullnameFieldFocusNode;
  TextEditingController? fullnameFieldTextController;
  String? Function(BuildContext, String?)? fullnameFieldTextControllerValidator;
  String? _fullnameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0le351ff' /* Please enter full name/usernam... */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1zdxi0ai' /* Please provide a valid email */,
      );
    }

    return null;
  }

  // State field(s) for Alternative-email widget.
  FocusNode? alternativeEmailFocusNode;
  TextEditingController? alternativeEmailTextController;
  String? Function(BuildContext, String?)?
      alternativeEmailTextControllerValidator;
  // State field(s) for CountryListmobile widget.
  String? countryListmobileValue;
  FormFieldController<String>? countryListmobileValueController;
  // State field(s) for phonenumberReadOnly widget.
  FocusNode? phonenumberReadOnlyFocusNode;
  TextEditingController? phonenumberReadOnlyTextController;
  String? Function(BuildContext, String?)?
      phonenumberReadOnlyTextControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  String? _phonenumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v3oevowr' /* Please enter mobile  number */,
      );
    }

    return null;
  }

  // State field(s) for CountryList widget.
  String? countryListValue;
  FormFieldController<String>? countryListValueController;
  // State field(s) for alternativephonenumber widget.
  FocusNode? alternativephonenumberFocusNode;
  TextEditingController? alternativephonenumberTextController;
  String? Function(BuildContext, String?)?
      alternativephonenumberTextControllerValidator;
  bool isDataUploading_thumbailimages = false;
  FFUploadedFile uploadedLocalFile_thumbailimages =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_thumbailimages = '';

  // State field(s) for about-yourself-field widget.
  FocusNode? aboutYourselfFieldFocusNode;
  TextEditingController? aboutYourselfFieldTextController;
  String? Function(BuildContext, String?)?
      aboutYourselfFieldTextControllerValidator;
  // State field(s) for location-field widget.
  FocusNode? locationFieldFocusNode;
  TextEditingController? locationFieldTextController;
  String? Function(BuildContext, String?)? locationFieldTextControllerValidator;
  // State field(s) for designstyle-field widget.
  List<String>? designstyleFieldValue;
  FormFieldController<List<String>>? designstyleFieldValueController;
  // State field(s) for Experience-field widget.
  FocusNode? experienceFieldFocusNode;
  TextEditingController? experienceFieldTextController;
  String? Function(BuildContext, String?)?
      experienceFieldTextControllerValidator;
  String? _experienceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j3kenw11' /* Please enter years of experien... */,
      );
    }

    if (!RegExp('^(0|[1-9][0-9]*)(\\.[0-9]+)?\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '9jrbibpt' /* Invalid format */,
      );
    }
    return null;
  }

  // State field(s) for EngagementRate-field widget.
  FocusNode? engagementRateFieldFocusNode;
  TextEditingController? engagementRateFieldTextController;
  String? Function(BuildContext, String?)?
      engagementRateFieldTextControllerValidator;
  // State field(s) for PreferredPromotionStyle-field widget.
  FocusNode? preferredPromotionStyleFieldFocusNode;
  TextEditingController? preferredPromotionStyleFieldTextController;
  String? Function(BuildContext, String?)?
      preferredPromotionStyleFieldTextControllerValidator;
  String? _preferredPromotionStyleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0h97vb5p' /* Please enter preferred promoti... */,
      );
    }

    return null;
  }

  // State field(s) for PortfolioorWebsiteLink-field widget.
  FocusNode? portfolioorWebsiteLinkFieldFocusNode;
  TextEditingController? portfolioorWebsiteLinkFieldTextController;
  String? Function(BuildContext, String?)?
      portfolioorWebsiteLinkFieldTextControllerValidator;
  // State field(s) for Instagram-field widget.
  FocusNode? instagramFieldFocusNode;
  TextEditingController? instagramFieldTextController;
  String? Function(BuildContext, String?)?
      instagramFieldTextControllerValidator;
  // State field(s) for Instagram-followers-field widget.
  FocusNode? instagramFollowersFieldFocusNode;
  TextEditingController? instagramFollowersFieldTextController;
  String? Function(BuildContext, String?)?
      instagramFollowersFieldTextControllerValidator;
  // State field(s) for TikTok-field widget.
  FocusNode? tikTokFieldFocusNode;
  TextEditingController? tikTokFieldTextController;
  String? Function(BuildContext, String?)? tikTokFieldTextControllerValidator;
  // State field(s) for TikTok-followersfield widget.
  FocusNode? tikTokFollowersfieldFocusNode;
  TextEditingController? tikTokFollowersfieldTextController;
  String? Function(BuildContext, String?)?
      tikTokFollowersfieldTextControllerValidator;
  // State field(s) for Facebook-field widget.
  FocusNode? facebookFieldFocusNode;
  TextEditingController? facebookFieldTextController;
  String? Function(BuildContext, String?)? facebookFieldTextControllerValidator;
  // State field(s) for Facebook-followersfield widget.
  FocusNode? facebookFollowersfieldFocusNode;
  TextEditingController? facebookFollowersfieldTextController;
  String? Function(BuildContext, String?)?
      facebookFollowersfieldTextControllerValidator;
  // State field(s) for Youtube-field widget.
  FocusNode? youtubeFieldFocusNode;
  TextEditingController? youtubeFieldTextController;
  String? Function(BuildContext, String?)? youtubeFieldTextControllerValidator;
  // State field(s) for Youtube-followersfield widget.
  FocusNode? youtubeFollowersfieldFocusNode;
  TextEditingController? youtubeFollowersfieldTextController;
  String? Function(BuildContext, String?)?
      youtubeFollowersfieldTextControllerValidator;
  // State field(s) for other-field widget.
  FocusNode? otherFieldFocusNode;
  TextEditingController? otherFieldTextController;
  String? Function(BuildContext, String?)? otherFieldTextControllerValidator;
  // State field(s) for collaborationsCheckbox widget.
  bool? collaborationsCheckboxValue;
  // State field(s) for TermsCheckbox widget.
  bool? termsCheckboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Next widget.
  IdMapRecord? iDMapResult;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
    fullnameFieldTextControllerValidator =
        _fullnameFieldTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phonenumberTextControllerValidator = _phonenumberTextControllerValidator;
    experienceFieldTextControllerValidator =
        _experienceFieldTextControllerValidator;
    preferredPromotionStyleFieldTextControllerValidator =
        _preferredPromotionStyleFieldTextControllerValidator;
  }

  @override
  void dispose() {
    userInitialModel.dispose();
    fullnameFieldFocusNode?.dispose();
    fullnameFieldTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    alternativeEmailFocusNode?.dispose();
    alternativeEmailTextController?.dispose();

    phonenumberReadOnlyFocusNode?.dispose();
    phonenumberReadOnlyTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    alternativephonenumberFocusNode?.dispose();
    alternativephonenumberTextController?.dispose();

    aboutYourselfFieldFocusNode?.dispose();
    aboutYourselfFieldTextController?.dispose();

    locationFieldFocusNode?.dispose();
    locationFieldTextController?.dispose();

    experienceFieldFocusNode?.dispose();
    experienceFieldTextController?.dispose();

    engagementRateFieldFocusNode?.dispose();
    engagementRateFieldTextController?.dispose();

    preferredPromotionStyleFieldFocusNode?.dispose();
    preferredPromotionStyleFieldTextController?.dispose();

    portfolioorWebsiteLinkFieldFocusNode?.dispose();
    portfolioorWebsiteLinkFieldTextController?.dispose();

    instagramFieldFocusNode?.dispose();
    instagramFieldTextController?.dispose();

    instagramFollowersFieldFocusNode?.dispose();
    instagramFollowersFieldTextController?.dispose();

    tikTokFieldFocusNode?.dispose();
    tikTokFieldTextController?.dispose();

    tikTokFollowersfieldFocusNode?.dispose();
    tikTokFollowersfieldTextController?.dispose();

    facebookFieldFocusNode?.dispose();
    facebookFieldTextController?.dispose();

    facebookFollowersfieldFocusNode?.dispose();
    facebookFollowersfieldTextController?.dispose();

    youtubeFieldFocusNode?.dispose();
    youtubeFieldTextController?.dispose();

    youtubeFollowersfieldFocusNode?.dispose();
    youtubeFollowersfieldTextController?.dispose();

    otherFieldFocusNode?.dispose();
    otherFieldTextController?.dispose();
  }
}
