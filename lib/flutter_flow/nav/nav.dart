import '/backend/links/azy_links.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/navigation/azy_back_policy.dart';
import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:branchio_dynamic_linking_akp5u6/index.dart'
    as $branchio_dynamic_linking_akp5u6;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  /// True only while the signed-in user is still unknown.
  ///
  /// This used to read `|| showSplashImage`, which held a splash video on screen
  /// for a fixed two seconds after launch -- so every opening of the home page
  /// sat through an animation before showing anything. That is removed: a page
  /// now renders as soon as auth resolves. The auth half stays, because
  /// rendering a protected page before the user is known would flash the entry
  /// screen and then redirect straight back.
  bool get loading => user == null;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $branchio_dynamic_linking_akp5u6.initializeRoutes(
    testHomePageWidgetName: 'branchio_dynamic_linking_akp5u6.TestHomePage',
    testHomePageWidgetPath: '/Home',
    testDashboardWidgetName: 'branchio_dynamic_linking_akp5u6.TestDashboard',
    testDashboardWidgetPath: '/Profile',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? const HomeWidget() : const EntryWidget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? const HomeWidget() : const EntryWidget(),
      ),
      FFRoute(
        name: HomeWidget.routeName,
        path: HomeWidget.routePath,
        builder: (context, params) => const HomeWidget(),
      ),
      FFRoute(
        name: Highlights1Widget.routeName,
        path: Highlights1Widget.routePath,
        builder: (context, params) => const Highlights1Widget(),
      ),
      FFRoute(
        name: EntryWidget.routeName,
        path: EntryWidget.routePath,
        builder: (context, params) => const EntryWidget(),
      ),
      FFRoute(
        name: RegisterWidget.routeName,
        path: RegisterWidget.routePath,
        builder: (context, params) => const RegisterWidget(),
      ),
      FFRoute(
        name: ShopWidget.routeName,
        path: ShopWidget.routePath,
        builder: (context, params) => const ShopWidget(),
      ),
      FFRoute(
        name: Step1PersonalWidget.routeName,
        path: Step1PersonalWidget.routePath,
        builder: (context, params) => const Step1PersonalWidget(),
      ),
      FFRoute(
        name: ProductListWidget.routeName,
        path: ProductListWidget.routePath,
        builder: (context, params) => const ProductListWidget(),
      ),
      FFRoute(
        name: Highlights2Widget.routeName,
        path: Highlights2Widget.routePath,
        builder: (context, params) => const Highlights2Widget(),
      ),
      FFRoute(
        name: Highlights3Widget.routeName,
        path: Highlights3Widget.routePath,
        builder: (context, params) => const Highlights3Widget(),
      ),
      FFRoute(
        name: Step2MeasurementsWidget.routeName,
        path: Step2MeasurementsWidget.routePath,
        builder: (context, params) => const Step2MeasurementsWidget(),
      ),
      FFRoute(
        name: Step3PreferredStyleWidget.routeName,
        path: Step3PreferredStyleWidget.routePath,
        asyncParams: {
          'category': getDoc(['category'], CategoryRecord.fromSnapshot),
        },
        builder: (context, params) => Step3PreferredStyleWidget(
          category: params.getParam(
            'category',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: Step4ReferralCodeWidget.routeName,
        path: Step4ReferralCodeWidget.routePath,
        builder: (context, params) => const Step4ReferralCodeWidget(),
      ),
      FFRoute(
        name: LoginWidget.routeName,
        path: LoginWidget.routePath,
        builder: (context, params) => const LoginWidget(),
      ),
      FFRoute(
        name: DesignersListWidget.routeName,
        path: DesignersListWidget.routePath,
        builder: (context, params) => const DesignersListWidget(),
      ),
      FFRoute(
        name: DesignerWidget.routeName,
        path: DesignerWidget.routePath,
        builder: (context, params) => DesignerWidget(
          designerUid: params.getParam(
            'designerUid',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: DesignerConsultWidget.routeName,
        path: DesignerConsultWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const DesignerConsultWidget(),
      ),
      FFRoute(
        name: DesignerConsultDetailsWidget.routeName,
        path: DesignerConsultDetailsWidget.routePath,
        asyncParams: {
          'designerDoc': getDoc(['users'], UsersRecord.fromSnapshot),
        },
        builder: (context, params) => DesignerConsultDetailsWidget(
          designerDoc: params.getParam(
            'designerDoc',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: DesignerBookingCompleteWidget.routeName,
        path: DesignerBookingCompleteWidget.routePath,
        builder: (context, params) => const DesignerBookingCompleteWidget(),
      ),
      FFRoute(
        name: CreatorsWidget.routeName,
        path: CreatorsWidget.routePath,
        builder: (context, params) => const CreatorsWidget(),
      ),
      FFRoute(
        name: CreatorsIndividualWidget.routeName,
        path: CreatorsIndividualWidget.routePath,
        builder: (context, params) => CreatorsIndividualWidget(
          creatorUid: params.getParam(
            'creatorUid',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ProfileWidget.routeName,
        path: ProfileWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const ProfileWidget(),
      ),
      FFRoute(
        name: ProfileEditWidget.routeName,
        path: ProfileEditWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const ProfileEditWidget(),
      ),
      FFRoute(
        name: WelcomeWidget.routeName,
        path: WelcomeWidget.routePath,
        builder: (context, params) => const WelcomeWidget(),
      ),
      FFRoute(
        name: RegisterVerificationWidget.routeName,
        path: RegisterVerificationWidget.routePath,
        builder: (context, params) => const RegisterVerificationWidget(),
      ),
      FFRoute(
        name: ProductWidget.routeName,
        path: ProductWidget.routePath,
        builder: (context, params) => ProductWidget(
          product: params.getParam(
            'product',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['products'],
          ),
        ),
      ),
      FFRoute(
        name: S1GiftCardsWidget.routeName,
        path: S1GiftCardsWidget.routePath,
        builder: (context, params) => const S1GiftCardsWidget(),
      ),
      FFRoute(
        name: S2CreateaGiftCardsWidget.routeName,
        path: S2CreateaGiftCardsWidget.routePath,
        builder: (context, params) => const S2CreateaGiftCardsWidget(),
      ),
      FFRoute(
        name: S3GiftCardcustomamountWidget.routeName,
        path: S3GiftCardcustomamountWidget.routePath,
        builder: (context, params) => const S3GiftCardcustomamountWidget(),
      ),
      FFRoute(
        name: PhoneWidget.routeName,
        path: PhoneWidget.routePath,
        builder: (context, params) => const PhoneWidget(),
      ),
      FFRoute(
        name: PhoneVerificationWidget.routeName,
        path: PhoneVerificationWidget.routePath,
        builder: (context, params) => const PhoneVerificationWidget(),
      ),
      FFRoute(
        name: CartWidget.routeName,
        path: CartWidget.routePath,
        requireAuth: true,
        builder: (context, params) => CartWidget(
          designerRef: params.getParam(
            'designerRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['users'],
          ),
        ),
      ),
      FFRoute(
        name: S4RedeemGiftCardWidget.routeName,
        path: S4RedeemGiftCardWidget.routePath,
        builder: (context, params) => const S4RedeemGiftCardWidget(),
      ),
      FFRoute(
        name: WishlistWidget.routeName,
        path: WishlistWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const WishlistWidget(),
      ),
      FFRoute(
        name: CheckoutWidget.routeName,
        path: CheckoutWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const CheckoutWidget(),
      ),
      FFRoute(
        name: S1RewardsWidget.routeName,
        path: S1RewardsWidget.routePath,
        builder: (context, params) => const S1RewardsWidget(),
      ),
      FFRoute(
        name: MembershipWidget.routeName,
        path: MembershipWidget.routePath,
        builder: (context, params) => const MembershipWidget(),
      ),
      FFRoute(
        name: S2CouponDetailsWidget.routeName,
        path: S2CouponDetailsWidget.routePath,
        builder: (context, params) => const S2CouponDetailsWidget(),
      ),
      FFRoute(
        name: SuccessWidget.routeName,
        path: SuccessWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const SuccessWidget(),
      ),
      FFRoute(
        name: MembershipPlanWidget.routeName,
        path: MembershipPlanWidget.routePath,
        builder: (context, params) => const MembershipPlanWidget(),
      ),
      FFRoute(
        name: DesignerFormWidget.routeName,
        path: DesignerFormWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const DesignerFormWidget(),
      ),
      FFRoute(
        name: DesignerPortofolioWidget.routeName,
        path: DesignerPortofolioWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const DesignerPortofolioWidget(),
      ),
      FFRoute(
        name: DesignerFormUploadWidget.routeName,
        path: DesignerFormUploadWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const DesignerFormUploadWidget(),
      ),
      FFRoute(
        name: DesignerFormSuccessWidget.routeName,
        path: DesignerFormSuccessWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const DesignerFormSuccessWidget(),
      ),
      FFRoute(
        name: CreatorFormWidget.routeName,
        path: CreatorFormWidget.routePath,
        builder: (context, params) => const CreatorFormWidget(),
      ),
      FFRoute(
        name: CreatorFormUploadWidget.routeName,
        path: CreatorFormUploadWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const CreatorFormUploadWidget(),
      ),
      FFRoute(
        name: CreatorFormSuccessWidget.routeName,
        path: CreatorFormSuccessWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const CreatorFormSuccessWidget(),
      ),
      FFRoute(
        name: OrdersWidget.routeName,
        path: OrdersWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const OrdersWidget(),
      ),
      FFRoute(
        name: PaymentWidget.routeName,
        path: PaymentWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const PaymentWidget(),
      ),
      FFRoute(
        name: OrdersDetailsWidget.routeName,
        path: OrdersDetailsWidget.routePath,
        builder: (context, params) => OrdersDetailsWidget(
          order: params.getParam(
            'order',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['orders'],
          ),
        ),
      ),
      FFRoute(
        name: FailedWidget.routeName,
        path: FailedWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const FailedWidget(),
      ),
      FFRoute(
        name: VerifyWidget.routeName,
        path: VerifyWidget.routePath,
        builder: (context, params) => const VerifyWidget(),
      ),
      FFRoute(
        name: S4ChooseRefundMethodWidget.routeName,
        path: S4ChooseRefundMethodWidget.routePath,
        builder: (context, params) => const S4ChooseRefundMethodWidget(),
      ),
      FFRoute(
        name: OrderReturnSubmitWidget.routeName,
        path: OrderReturnSubmitWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const OrderReturnSubmitWidget(),
      ),
      FFRoute(
        name: CreatorSpaceWidget.routeName,
        path: CreatorSpaceWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const CreatorSpaceWidget(),
      ),
      FFRoute(
        name: S2CreatorWalletWidget.routeName,
        path: S2CreatorWalletWidget.routePath,
        requireAuth: true,
        builder: (context, params) => S2CreatorWalletWidget(
          promotionDetails: params.getParam(
            'promotionDetails',
            ParamType.DataStruct,
            isList: false,
            structBuilder: CreatorPromotionsStruct.fromSerializableMap,
          ),
        ),
      ),
      FFRoute(
        name: S3QuickStatsWidget.routeName,
        path: S3QuickStatsWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const S3QuickStatsWidget(),
      ),
      FFRoute(
        name: PromotedProductsListingWidget.routeName,
        path: PromotedProductsListingWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const PromotedProductsListingWidget(),
      ),
      FFRoute(
        name: S5PromotiondetailsWidget.routeName,
        path: S5PromotiondetailsWidget.routePath,
        requireAuth: true,
        builder: (context, params) => S5PromotiondetailsWidget(
          promotionInfo: params.getParam(
            'promotionInfo',
            ParamType.DataStruct,
            isList: false,
            structBuilder: CreatorPromotionsStruct.fromSerializableMap,
          ),
        ),
      ),
      FFRoute(
        name: S6PreApprovedCreatePromotionWidget.routeName,
        path: S6PreApprovedCreatePromotionWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const S6PreApprovedCreatePromotionWidget(),
      ),
      FFRoute(
        name: S7SelectedDressWidget.routeName,
        path: S7SelectedDressWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const S7SelectedDressWidget(),
      ),
      FFRoute(
        name: CreatePromotionCustomWidget.routeName,
        path: CreatePromotionCustomWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const CreatePromotionCustomWidget(),
      ),
      FFRoute(
        name: CreatorsPromotionSubmittedSuccesfullyWidget.routeName,
        path: CreatorsPromotionSubmittedSuccesfullyWidget.routePath,
        requireAuth: true,
        builder: (context, params) =>
            const CreatorsPromotionSubmittedSuccesfullyWidget(),
      ),
      FFRoute(
        name: S1FAQContactusWidget.routeName,
        path: S1FAQContactusWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const S1FAQContactusWidget(),
      ),
      FFRoute(
        name: ForgotPasswordWidget.routeName,
        path: ForgotPasswordWidget.routePath,
        builder: (context, params) => const ForgotPasswordWidget(),
      ),
      FFRoute(
        name: S8CustomUploadsCreatePromotionbcWidget.routeName,
        path: S8CustomUploadsCreatePromotionbcWidget.routePath,
        requireAuth: true,
        asyncParams: {
          'products': getDoc(['products'], ProductsRecord.fromSnapshot),
        },
        builder: (context, params) => S8CustomUploadsCreatePromotionbcWidget(
          products: params.getParam(
            'products',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: CreatorsIndividualPromoWidget.routeName,
        path: CreatorsIndividualPromoWidget.routePath,
        builder: (context, params) => CreatorsIndividualPromoWidget(
          promo: params.getParam(
            'promo',
            ParamType.String,
          ),
          creatorUid: params.getParam(
            'creatorUid',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: AddressWidget.routeName,
        path: AddressWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const AddressWidget(),
      ),
      FFRoute(
        name: DesignerApplicationStatusWidget.routeName,
        path: DesignerApplicationStatusWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const DesignerApplicationStatusWidget(),
      ),
      FFRoute(
        name: ReferFriendWidget.routeName,
        path: ReferFriendWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const ReferFriendWidget(),
      ),
      FFRoute(
        name: MeasurementWidget.routeName,
        path: MeasurementWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const MeasurementWidget(),
      ),
      FFRoute(
        name: ComingSoonWidget.routeName,
        path: ComingSoonWidget.routePath,
        builder: (context, params) => ComingSoonWidget(
          type: params.getParam(
            'type',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: StoresListWidget.routeName,
        path: StoresListWidget.routePath,
        builder: (context, params) => const StoresListWidget(),
      ),
      FFRoute(
        name: VirtualTryOnWidget.routeName,
        path: VirtualTryOnWidget.routePath,
        builder: (context, params) => const VirtualTryOnWidget(),
      ),
      FFRoute(
        name: VirtualTryOnSlidesWidget.routeName,
        path: VirtualTryOnSlidesWidget.routePath,
        builder: (context, params) => VirtualTryOnSlidesWidget(
          product: params.getParam(
            'product',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['products'],
          ),
        ),
      ),
      FFRoute(
        name: WaitlistSecretWidget.routeName,
        path: WaitlistSecretWidget.routePath,
        builder: (context, params) => WaitlistSecretWidget(
          navigation: params.getParam(
            'navigation',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TermsWidget.routeName,
        path: TermsWidget.routePath,
        builder: (context, params) => const TermsWidget(),
      ),
      FFRoute(
        name: PrivacyPolicyWidget.routeName,
        path: PrivacyPolicyWidget.routePath,
        builder: (context, params) => const PrivacyPolicyWidget(),
      ),
      FFRoute(
        name: ShortlistWidget.routeName,
        path: ShortlistWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const ShortlistWidget(),
      ),
      FFRoute(
        name: WaitlistFormWidget.routeName,
        path: WaitlistFormWidget.routePath,
        builder: (context, params) => const WaitlistFormWidget(),
      ),
      FFRoute(
        name: WaitlistMainWidget.routeName,
        path: WaitlistMainWidget.routePath,
        builder: (context, params) => const WaitlistMainWidget(),
      ),
      FFRoute(
        name: WaitlistSuccessWidget.routeName,
        path: WaitlistSuccessWidget.routePath,
        builder: (context, params) => WaitlistSuccessWidget(
          waiterRef: params.getParam(
            'waiterRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['user_waitlist'],
          ),
        ),
      ),
      FFRoute(
        name: OrderReturnWidget.routeName,
        path: OrderReturnWidget.routePath,
        requireAuth: true,
        builder: (context, params) => OrderReturnWidget(
          order: params.getParam(
            'order',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['orders'],
          ),
        ),
      ),
      FFRoute(
        name: FreePaymentWidget.routeName,
        path: FreePaymentWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const FreePaymentWidget(),
      ),
      FFRoute(
        name: HomeSearchWidget.routeName,
        path: HomeSearchWidget.routePath,
        requireAuth: true,
        builder: (context, params) => const HomeSearchWidget(),
      ),
      // Share links (see AzyLinks). Each opens the same screen as the older
      // route beside it, with the ids taken from the link's path.
      FFRoute(
        name: 'LinkProduct',
        path: AzyLinks.productPath,
        builder: (context, params) => ProductCopyWidget(
          productID: params.getParam(
            'productID',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: 'LinkCreator',
        path: AzyLinks.creatorPath,
        builder: (context, params) => CreatorsIndividualWidget(
          creatorUid: params.getParam(
            'creatorUid',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: 'LinkDesigner',
        path: AzyLinks.designerPath,
        builder: (context, params) => DesignerWidget(
          designerUid: params.getParam(
            'designerUid',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: 'LinkPromo',
        path: AzyLinks.promoPath,
        builder: (context, params) => CreatorsIndividualPromoWidget(
          promo: params.getParam(
            'promo',
            ParamType.String,
          ),
          creatorUid: params.getParam(
            'creatorUid',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ProductCopyWidget.routeName,
        path: ProductCopyWidget.routePath,
        builder: (context, params) => ProductCopyWidget(
          productID: params.getParam(
            'productID',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: $branchio_dynamic_linking_akp5u6.TestHomePageWidget.routeName,
        path: $branchio_dynamic_linking_akp5u6.TestHomePageWidget.routePath,
        builder: (context, params) =>
            const $branchio_dynamic_linking_akp5u6.TestHomePageWidget(),
      ),
      FFRoute(
        name: $branchio_dynamic_linking_akp5u6.TestDashboardWidget.routeName,
        path: $branchio_dynamic_linking_akp5u6.TestDashboardWidget.routePath,
        builder: (context, params) =>
            $branchio_dynamic_linking_akp5u6.TestDashboardWidget(
          title: params.getParam(
            'title',
            ParamType.String,
          ),
        ),
      )
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo {
    final possibleKeys = [
      '__transition_info__',
      '__transition_info__branchio_dynamic_linking_akp5u6'
    ];
    for (final key in possibleKeys) {
      if (extraMap.containsKey(key)) {
        return extraMap[key] as TransitionInfo;
      }
    }
    return TransitionInfo.appDefault();
  }
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/azyaa-entry';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/splash_video.webp',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          // Every page gets the app-wide back policy. This is the one place all
          // routes are built, so no page can be missed -- and it has to be here,
          // inside the route, because PopScope registers through
          // `ModalRoute.of(context)` and would do nothing above the Navigator.
          final guardedChild = AzyBackGuard(child: child);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: guardedChild,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: guardedChild);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
