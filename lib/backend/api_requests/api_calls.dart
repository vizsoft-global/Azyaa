import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OTPless Group Code

class OTPlessGroup {
  static String getBaseUrl({
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) =>
      '${url}';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static SendCall sendCall = SendCall();
  static ResendCall resendCall = ResendCall();
  static VerifyCall verifyCall = VerifyCall();
  static SendSMSCall sendSMSCall = SendSMSCall();
  static VerifySMSCall verifySMSCall = VerifySMSCall();
  static SendEmailOTPCall sendEmailOTPCall = SendEmailOTPCall();
}

class SendCall {
  Future<ApiCallResponse> call({
    String? phoneno = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "phoneNumber": "${phoneno}",
  "otpLength": 6,
  "channel": "WHATSAPP",
  "expiry": 300
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send',
      apiUrl: '${baseUrl}send_opt_whatsapp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? orderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orderId''',
      ));
}

class ResendCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "orderId": "${orderId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Resend',
      apiUrl: '${baseUrl}resend_opt_whatsapp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic orderid(dynamic response) => getJsonField(
        response,
        r'''$.orderId''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class VerifyCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    int? otp,
    String? phoneno = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "orderId": "${orderId}",
  "otp": "${otp}",
  "phoneNumber": "${phoneno}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify',
      apiUrl: '${baseUrl}verify_opt_whatsapp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isOTPVerified''',
      ));
}

class SendSMSCall {
  Future<ApiCallResponse> call({
    String? phoneno = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "phoneNumber": "${phoneno}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendSMS',
      apiUrl: '${baseUrl}send_opt_sms',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? requestId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.requestId''',
      ));
}

class VerifySMSCall {
  Future<ApiCallResponse> call({
    String? requestId = '',
    String? otp = '',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
    "requestId": "${requestId}",
    "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerifySMS',
      apiUrl: '${baseUrl}verify_opt_sms',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? status(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isOTPVerified''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? requestID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.requestId''',
      ));
}

class SendEmailOTPCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? expiry = '86400',
    String? url =
        'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/',
  }) async {
    final baseUrl = OTPlessGroup.getBaseUrl(
      url: url,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "expiry": "${expiry}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmailOTP',
      apiUrl: '${baseUrl}send_opt_email',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OTPless Group Code

/// Start Upayment Group Code

class UpaymentGroup {
  static String getBaseUrl({
    String? url = 'sandboxapi',
    String? aPIkey = 'jtest123',
  }) =>
      'https://proxy.vizsoft.in/https://${url}.upayments.com/api/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [APIkey]',
    'accept': 'application/json',
    'content-type': 'application/json',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static ChargeCall chargeCall = ChargeCall();
  static StatusCall statusCall = StatusCall();
}

class ChargeCall {
  Future<ApiCallResponse> call({
    String? orderId = '202210101202210123',
    String? programRef = '202210101202210123',
    String? programTitle = '',
    String? programPrice = '',
    String? customerId = '',
    String? customerName = '',
    String? customerEmail = '',
    String? customerPhone = '',
    String? returnURL = '',
    String? cancelURL = '',
    String? notificationURL = '',
    String? url = 'sandboxapi',
    String? aPIkey = 'jtest123',
  }) async {
    final baseUrl = UpaymentGroup.getBaseUrl(
      url: url,
      aPIkey: aPIkey,
    );

    final ffApiRequestBody = '''
{
  "order": {
    "id": "${orderId}",
    "reference": "${programRef}",
    "description": "${programTitle}",
    "currency": "KWD",
    "amount": "${programPrice}"
  },
  "language": "en",
  "paymentGateway": {
    "src": "knet"
  },
  "reference": {
    "id": "${orderId}"
  },
  "customer": {
    "uniqueId": "${customerId}",
    "name": "${customerName}",
    "email": "${customerEmail}",
    "mobile": "${customerPhone}"
  },
  "returnUrl": "${returnURL}",
  "cancelUrl": "${cancelURL}",
  "notificationUrl": "${notificationURL}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Charge',
      apiUrl: '${baseUrl}charge',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${aPIkey}',
        'accept': 'application/json',
        'content-type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? chargeLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.link''',
      ));
  String? chargeMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class StatusCall {
  Future<ApiCallResponse> call({
    String? trackId = '',
    String? url = 'sandboxapi',
    String? aPIkey = 'jtest123',
  }) async {
    final baseUrl = UpaymentGroup.getBaseUrl(
      url: url,
      aPIkey: aPIkey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Status',
      apiUrl: '${baseUrl}get-payment-status/${trackId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${aPIkey}',
        'accept': 'application/json',
        'content-type': 'application/json',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {
        'trackId': trackId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? paymentID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.payment_id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.result''',
      ));
  String? paymentTYPE(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.payment_type''',
      ));
  String? paymentMETHOD(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.transaction.payment_method''',
      ));
}

/// End Upayment Group Code

/// Start TAP Group Code

class TapGroup {
  static String getBaseUrl({
    String? secreatKey = '',
    String? url = 'https://proxy.vizsoft.in/https://api.tap.company/',
  }) =>
      '${url}v2/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [secreatKey]',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static ChargeAPICall chargeAPICall = ChargeAPICall();
  static StatusAPICall statusAPICall = StatusAPICall();
}

class ChargeAPICall {
  Future<ApiCallResponse> call({
    double? amount,
    String? productList = '',
    String? clientname = '',
    String? orderID = '',
    String? clientemail = '',
    String? clientphone = '',
    int? merchantid,
    String? postURL = '',
    String? redirectURL = '',
    String? secreatKey = '',
    String? url = 'https://proxy.vizsoft.in/https://api.tap.company/',
  }) async {
    final baseUrl = TapGroup.getBaseUrl(
      secreatKey: secreatKey,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "currency": "KWD",
  "threeDSecure": true,
  "save_card": false,
  "description": "${productList}",
  "statement_descriptor": "${clientname}",
  "metadata": {},
  "reference": {
    "transaction": "txn_0001",
    "order": "${orderID}"
  },
  "receipt": {
    "email": false,
    "sms": true
  },
  "customer": {
    "first_name": "${clientname}",
    "middle_name": "",
    "last_name": "",
    "email": "${clientemail}",
    "phone": {
      "country_code": "",
      "number": "${clientphone}"
    }
  },
  "merchant": {
    "id": "${merchantid}"
  },
  "source": {
    "id": "src_all"
  },
  "post": {
    "url": "${postURL}"
  },
  "redirect": {
    "url": "${redirectURL}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChargeAPI',
      apiUrl: '${baseUrl}charges',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${secreatKey}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? chargeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? chargeUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.transaction.url''',
      ));
  String? changeRedirect(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.redirect.url''',
      ));
  String? changePost(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.post.url''',
      ));
}

class StatusAPICall {
  Future<ApiCallResponse> call({
    String? chargeid = '',
    String? secreatKey = '',
    String? url = 'https://proxy.vizsoft.in/https://api.tap.company/',
  }) async {
    final baseUrl = TapGroup.getBaseUrl(
      secreatKey: secreatKey,
      url: url,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StatusAPI',
      apiUrl: '${baseUrl}charges/${chargeid}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${secreatKey}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {
        'chargeid': chargeid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? chargeId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? merchantId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.merchant.id''',
      ));
  String? gatewayRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reference.gateway''',
      ));
  String? paymentRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reference.payment''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.transaction.created''',
      ));
  String? paymentMethod(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.source.payment_method''',
      ));
  String? paymentType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.source.payment_type''',
      ));
}

/// End TAP Group Code

/// Start Upload files or Images Group Code

class UploadFilesOrImagesGroup {
  static String getBaseUrl() =>
      'https://proxy.vizsoft.in/https://standalone-5vgm.onrender.com/';
  static Map<String, String> headers = {
    'x-requested-with': 'https://proxy.vizsoft.in',
    'origin': 'https://proxy.vizsoft.in',
  };
  static UploadFileOrImageCall uploadFileOrImageCall = UploadFileOrImageCall();
}

class UploadFileOrImageCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    final baseUrl = UploadFilesOrImagesGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'upload file or image',
      apiUrl: '${baseUrl}process_file',
      callType: ApiCallType.POST,
      headers: {
        'x-requested-with': 'https://proxy.vizsoft.in',
        'origin': 'https://proxy.vizsoft.in',
      },
      params: {
        'file': file,
        'process': 2,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Upload files or Images Group Code

/// Start Myfatoorah Group Code

class MyfatoorahGroup {
  static String getBaseUrl({
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) =>
      'https://proxy.vizsoft.in/https://${url}.myfatoorah.com/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer [token]',
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static InvoiceCall invoiceCall = InvoiceCall();
  static InvoiceStatusCall invoiceStatusCall = InvoiceStatusCall();
  static ExecuteCall executeCall = ExecuteCall();
  static MakeRefundCall makeRefundCall = MakeRefundCall();
}

class InvoiceCall {
  Future<ApiCallResponse> call({
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "CustomerName": "name",
  "NotificationOption": "ALL",
  "MobileCountryCode": "965",
  "CustomerMobile": "12345678",
  "CustomerEmail": "rohit@vizsoft.in",
  "InvoiceValue": 100,
  "DisplayCurrencyIso": "kwd",
  "CallBackUrl": "https://yoursite.com/success",
  "ErrorUrl": "https://yoursite.com/error",
  "WebhookUrl": "https://hook.us1.make.com/p7og7qm3g9v7amn2rdx6odh24brwvypj?project=azyaa&&paymenttype=myfatoorah",
  "Language": "en",
  "CustomerReference": "ORDAZYA10087",
  "CustomerAddress": {
    "Block": "string",
    "Street": "string",
    "HouseBuildingNo": "string",
    "Address": "address",
    "AddressInstructions": "string"
  },
  "InvoiceItems": [
    {
      "ItemName": "string",
      "Quantity": 20,
      "UnitPrice": 5
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Invoice',
      apiUrl: '${baseUrl}v2/SendPayment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? invoiceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.InvoiceId''',
      ));
  String? invoiceURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceURL''',
      ));
}

class InvoiceStatusCall {
  Future<ApiCallResponse> call({
    String? invoiceId = '',
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "Key": "${invoiceId}",
  "KeyType": "Invoiceid"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Invoice Status',
      apiUrl: '${baseUrl}v2/GetPaymentStatus',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceStatus''',
      ));
  int? invoiceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.InvoiceId''',
      ));
  double? invoiceAmount(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Data.InvoiceValue''',
      ));
  String? invoiceMethod(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].PaymentGateway''',
      ));
  String? paymentID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].PaymentId''',
      ));
  String? referenceID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].ReferenceId''',
      ));
  String? invoiceRef(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceReference''',
      ));
  String? transactionID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.InvoiceTransactions[1].TransactionId''',
      ));
}

class ExecuteCall {
  Future<ApiCallResponse> call({
    String? customerName = '',
    String? customerDailCode = '',
    String? customerPhone = '',
    String? customerEmail = '',
    double? programPrice,
    String? returnURL = '',
    String? orderId = '',
    String? cartInfo = '',
    String? paymentMethodID = '',
    String? webhookUrl = '',
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
   "PaymentMethodId":${paymentMethodID},
   "CustomerName":"${customerName}",
   "DisplayCurrencyIso":"KWD",
   "MobileCountryCode":"${customerDailCode}",
   "CustomerMobile":"${customerPhone}",
   "CustomerEmail":"${customerEmail}",
   "InvoiceValue": ${programPrice},
   "CallBackUrl": "${returnURL}",
   "ErrorUrl": "${returnURL}",
   "WebhookUrl": "${webhookUrl}",
   "Language":"en",
   "CustomerReference":"${orderId}",
   "UserDefinedField": "${cartInfo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Execute',
      apiUrl: '${baseUrl}v2/ExecutePayment',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? invoiceID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Data.InvoiceId''',
      ));
  String? paymentURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Data.PaymentURL''',
      ));
}

class MakeRefundCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? keyType = '',
    bool? serviceChargeOnCustomer,
    double? amount,
    String? comment = '',
    double? amountDeductedFromSupplier = 0.0,
    String? token =
        'SK_KWT_vVZlnnAqu8jRByOWaRPNId4ShzEDNt256dvnjebuyzo52dXjAfRx2ixW5umjWSUx',
    String? url = 'apitest',
  }) async {
    final baseUrl = MyfatoorahGroup.getBaseUrl(
      token: token,
      url: url,
    );

    final ffApiRequestBody = '''
{
  "Key": "${escapeStringForJson(key)}",
  "KeyType": "${escapeStringForJson(keyType)}",
  "ServiceChargeOnCustomer": ${serviceChargeOnCustomer},
  "Amount": ${amount},
  "Comment": "${escapeStringForJson(comment)}",
  "AmountDeductedFromSupplier": ${amountDeductedFromSupplier}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MakeRefund',
      apiUrl: '${baseUrl}/v2/MakeRefund',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Myfatoorah Group Code

/// Start VirtualTryOn Group Code

class VirtualTryOnGroup {
  static String getBaseUrl() =>
      'https://proxy.vizsoft.in/https://newplot.onrender.com';
  static Map<String, String> headers = {
    'x-requested-with': 'https://proxy.vizsoft.in',
  };
  static MainCall mainCall = MainCall();
  static VTOStatusCall vTOStatusCall = VTOStatusCall();
}

class MainCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? personImage,
    FFUploadedFile? outfitImage,
    String? personUrl = '',
    String? outfitUrl = '',
    String? prompt =
        '[{\\\"type\\\":\\\"text\\\",\\\"key\\\":\\\"prompt\\\",\\\"value\\\":\\\"professional portrait, high quality, retain the same colors of outfit correctly.Also keep the posture of the person as it is don\'t change according to outfit image\\\"}]',
    String? resolution = 'high',
    int? numImages = 1,
  }) async {
    final baseUrl = VirtualTryOnGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Main',
      apiUrl: '${baseUrl}/virtual-try-on',
      callType: ApiCallType.POST,
      headers: {
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {
        'person_image': personImage,
        'outfit_image': outfitImage,
        'person_url': personUrl,
        'outfit_url': outfitUrl,
        'prompt': prompt,
        'resolution': resolution,
        'num_images': numImages,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? starttimestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].created_timestamp''',
      ));
  String? caption(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].caption''',
      ));
  int? creditsused(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].credits_used''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? resolution(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].resolution''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].status''',
      ));
  String? task(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].task''',
      ));
  String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].user_id''',
      ));
}

class VTOStatusCall {
  Future<ApiCallResponse> call({
    String? id = 'a',
  }) async {
    final baseUrl = VirtualTryOnGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'VTO Status',
      apiUrl: '${baseUrl}/check-status',
      callType: ApiCallType.GET,
      headers: {
        'x-requested-with': 'https://proxy.vizsoft.in',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? estimatationTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.est_finish_timestamp''',
      ));
  String? resultTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.finish_timestamp''',
      ));
  String? resultPath(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.path''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

/// End VirtualTryOn Group Code

/// Start Duo Deeplink Group Code

class DuoDeeplinkGroup {
  static String getBaseUrl({
    String? apiKey = 'dub_YJQ2QiV06sNRaFUtSjOl5TME',
  }) =>
      'https://proxy.vizsoft.in/https://api.dub.co/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [apiKey]',
    'x-requested-with': 'https://proxy.vizsoft.in',
    'origin': 'https://proxy.vizsoft.in',
  };
  static CreateLinkCall createLinkCall = CreateLinkCall();
}

class CreateLinkCall {
  Future<ApiCallResponse> call({
    String? url = '',
    String? domain = '',
    String? programID = '',
    String? title = '',
    String? description = '',
    String? image = '',
    String? android = '',
    String? ios = '',
    String? externalID = '',
    String? apiKey = 'dub_YJQ2QiV06sNRaFUtSjOl5TME',
  }) async {
    final baseUrl = DuoDeeplinkGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "url": "${url}",
  "domain": "${domain}",
  "key": "",
  "trackConversion": false,
  "externalId": "${externalID}",
  "archived": false,
  "proxy": false,
  "title": "${title}",
  "description": "${description}",
  "image": "${image}",
  "rewrite": false,
  "ios": "${ios}",
  "android": "${android}",
  "doIndex": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Link',
      apiUrl: '${baseUrl}links',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
        'x-requested-with': 'https://proxy.vizsoft.in',
        'origin': 'https://proxy.vizsoft.in',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? shortLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shortLink''',
      ));
  String? qrcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.qrCode''',
      ));
}

/// End Duo Deeplink Group Code

class WaterMarkImageCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'WaterMark Image',
      apiUrl: 'https://newplot.onrender.com/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
