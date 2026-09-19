import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';

import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    await _handlePushNotificationData(message.data);
  }

  Future _handlePushNotificationData(Map<String, dynamic> messageData) async {
    safeSetState(() => _loading = true);
    try {
      final initialPageName = messageData['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(messageData);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Splash_Video_Azyaa_(1)_(1)_(1).gif',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Home': ParameterData.none(),
  'testPage': ParameterData.none(),
  'Highlights1': ParameterData.none(),
  'Entry': ParameterData.none(),
  'Register': ParameterData.none(),
  'Shop': ParameterData.none(),
  'Step1-Personal': ParameterData.none(),
  'ProductList': ParameterData.none(),
  's2-Highlightsssbc': ParameterData.none(),
  'Highlights2': ParameterData.none(),
  'Highlights3': ParameterData.none(),
  'Step2-Measurements': ParameterData.none(),
  'Step3-PreferredStyle': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<CategoryRecord>(
              data, 'category', CategoryRecord.fromSnapshot),
        },
      ),
  'Step4-ReferralCode': ParameterData.none(),
  'Login': ParameterData.none(),
  'Designers-List': ParameterData.none(),
  'Designer': (data) async => ParameterData(
        allParams: {
          'designerUid': getParameter<String>(data, 'designerUid'),
        },
      ),
  'DesignerConsult': ParameterData.none(),
  'DesignerConsultDetails': (data) async => ParameterData(
        allParams: {
          'designerDoc': await getDocumentParameter<UsersRecord>(
              data, 'designerDoc', UsersRecord.fromSnapshot),
        },
      ),
  'DesignerBookingComplete': ParameterData.none(),
  'Creators': ParameterData.none(),
  'Creators-Individual': (data) async => ParameterData(
        allParams: {
          'creatorUid': getParameter<String>(data, 'creatorUid'),
        },
      ),
  'Profile': ParameterData.none(),
  'Profile-Edit': ParameterData.none(),
  'Welcome': ParameterData.none(),
  'Register_Verification': ParameterData.none(),
  'Product': (data) async => ParameterData(
        allParams: {
          'product': getParameter<DocumentReference>(data, 'product'),
        },
      ),
  's1-GiftCards': ParameterData.none(),
  's2-CreateaGiftCards': ParameterData.none(),
  's3-GiftCardcustomamount': ParameterData.none(),
  'Phone': ParameterData.none(),
  'Phone_Verification': ParameterData.none(),
  'Cart': (data) async => ParameterData(
        allParams: {
          'designerRef': getParameter<DocumentReference>(data, 'designerRef'),
        },
      ),
  's4-RedeemGiftCard': ParameterData.none(),
  'Wishlist': ParameterData.none(),
  'Checkout': ParameterData.none(),
  's1-Rewards': ParameterData.none(),
  'Membership': ParameterData.none(),
  's2-CouponDetails': ParameterData.none(),
  'Success': ParameterData.none(),
  'Membership-Plan': ParameterData.none(),
  'Designer-Form': ParameterData.none(),
  'Designer-Portofolio': ParameterData.none(),
  'Designer-FormUpload': ParameterData.none(),
  'Designer-FormSuccess': ParameterData.none(),
  'Creator-Form': ParameterData.none(),
  'Creator-FormUpload': ParameterData.none(),
  'Creator-FormSuccess': ParameterData.none(),
  'Orders': ParameterData.none(),
  'Payment': ParameterData.none(),
  'Orders_Details': (data) async => ParameterData(
        allParams: {
          'order': getParameter<DocumentReference>(data, 'order'),
        },
      ),
  'Failed': ParameterData.none(),
  'Verify': ParameterData.none(),
  's4-ChooseRefundMethod': ParameterData.none(),
  'OrderReturnSubmit': ParameterData.none(),
  'CreatorSpace': ParameterData.none(),
  's2-CreatorWallet': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  's3-QuickStats': ParameterData.none(),
  'PromotedProductsListing': ParameterData.none(),
  's5-Promotiondetails': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  's6-Pre-ApprovedCreatePromotion': ParameterData.none(),
  's7-SelectedDress': ParameterData.none(),
  'CreatePromotionCustom': ParameterData.none(),
  'CreatorsPromotion-SubmittedSuccesfully': ParameterData.none(),
  's1-FAQ-Contactus': ParameterData.none(),
  'Forgot-password': ParameterData.none(),
  's8-CustomUploadsCreatePromotionbc': (data) async => ParameterData(
        allParams: {
          'products': await getDocumentParameter<ProductsRecord>(
              data, 'products', ProductsRecord.fromSnapshot),
        },
      ),
  'test_list': ParameterData.none(),
  'CreatorSpacetestpage': ParameterData.none(),
  'Creators-IndividualPromo': (data) async => ParameterData(
        allParams: {
          'promo': getParameter<String>(data, 'promo'),
          'creatorUid': getParameter<String>(data, 'creatorUid'),
        },
      ),
  'Profile-EditTEMP': ParameterData.none(),
  'Address': ParameterData.none(),
  'Measurement': ParameterData.none(),
  'ComingSoon': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'Stores-List': ParameterData.none(),
  'VirtualTryOn': ParameterData.none(),
  'TEST': ParameterData.none(),
  'VirtualTryOn_Slides': (data) async => ParameterData(
        allParams: {
          'product': getParameter<DocumentReference>(data, 'product'),
        },
      ),
  'VirtualTryOnCopy': ParameterData.none(),
  'Waitlist_Secret': (data) async => ParameterData(
        allParams: {
          'navigation': getParameter<String>(data, 'navigation'),
        },
      ),
  'Terms': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'Shortlist': ParameterData.none(),
  'Waitlist_Form': ParameterData.none(),
  'Waitlist_Main': ParameterData.none(),
  'Waitlist_Success': (data) async => ParameterData(
        allParams: {
          'waiterRef': getParameter<DocumentReference>(data, 'waiterRef'),
        },
      ),
  'OrderReturn': (data) async => ParameterData(
        allParams: {
          'order': getParameter<DocumentReference>(data, 'order'),
        },
      ),
  'TESTheader': ParameterData.none(),
  'freePayment': ParameterData.none(),
  'home-search': ParameterData.none(),
  'addresstest': ParameterData.none(),
  'Delete': ParameterData.none(),
  'ProductCopy': (data) async => ParameterData(
        allParams: {
          'productID': getParameter<String>(data, 'productID'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
