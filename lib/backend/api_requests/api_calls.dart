import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PnrenquiryCall {
  static Future<ApiCallResponse> call({
    String? pnrnumber = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PNRENQUIRY',
      apiUrl:
          'https://irctc-indian-railway-pnr-status.p.rapidapi.com/getPNRStatus/{PNRNUMBER}',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-key': 'cf7a35d1d7msh770b01d0eda5627p15156ajsna0d3bec9434a',
        'x-rapidapi-host': 'irctc-indian-railway-pnr-status.p.rapidapi.com',
      },
      params: {
        'PNRNUMBER': pnrnumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DialogflowchatbotCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "queryInput": {
    "text": {
      "text": "YOUR_USER_MESSAGE",
      "languageCode": "en"
    }
  }
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Dialogflowchatbot',
      apiUrl:
          'https://dialogflow.googleapis.com/v2/projects/cooliegochatbot-vkmj/agent/sessions/1234:detectIntent',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer ya29.c.c0ASRK0GaebUaPo_s9Lr3qUqhIh2SjDsotaR1-kheGXnxYEMouzii53TPj9ue1WCEFoxtrP40VllU1s1EOhJztV8IOjKXevbaIxl6xvKexScO0O3C-q1v0KCYGdKDa7b1Tl61l7pbU6w3rzrrxMgo-BdvLp5eZ6MHm6xpeNrJSPiK652-CTl8TX_W_1E1Pr3eKHBVnlwMCXKZJ0LU0UOulEpeSinPJ5pjMJUyi2vUQjU2TuDUsGqWBu8HlXhKluM2ZixC8s2MSWIgR5GGNUF8srKb8GJ12E0d_P0__3BAbifgk1CO6Jv6L2r9ft2O0IwGFTLt3lyRnbo03mZgMj6SlYTclzvV_2FCunNzv1LkZdcCUGMyKQCUPgTiWKjcVIl_OuByuG397AWjW1Yuth_Rc5mQF6Xy6j9qqe8c_I0vg_JoX_yS0c9uuUW5d1j5SUk6-2yMazZx4f05gIkpJyvttgYQppRhSg61qimpx7lJ1cw3Id4zj6zsaWMy0brYr8Wtn4hJgji1W3WoilB25e6SgxaBzxZUsMVYhmn9tQ1Mw5vnqybvkMZOM06qiewgaz_xe6W3FFq9FXBR86_UqI6wx5ItZm-zZ_Xq-VqbsjjldX2QYoVl7tI9jlq6cccwV4zQp-_Wlr2mIZQ1JrQo2-fxouOYI94svoS40wQzO8Fv3Q7rlj6wdr3QbheWwBbgZBz_rlF-6rpF1RXZR72S-5BchSJQIY5p02qV_7hM96c5hbggpySrc6f-Fv_aYtx8u25pWnUiqpo_B0fr2W8k7Jc36R1hvohzU84WzUoz1Ws9rOJQ-tXWzVUQUyVJdhV6SyYuJsMswQhqz9B_OnYSm-ZbvMVq2pwB9IZ1fRx1kbQ-ervqotzySzWujuzquq-k-_4Yj6wkhRrdFw1Ry8VX0ph_fgfnke-y5SVfbfevrIihynJbzwocxhBunusZpU2J7MiuXeVZgdtjI_iWy89RZ-obSuOl97F6eznO0F8Zv0v1M1FmzelvU97JfQ7j',
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

class RealtpnrenquiryrapidCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'REALTPNRENQUIRYRAPID',
      apiUrl:
          'https://real-time-pnr-status-api-for-indian-railways.p.rapidapi.com/indianrail/6217743114',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-key': 'cf7a35d1d7msh770b01d0eda5627p15156ajsna0d3bec9434a',
        'x-rapidapi-host':
            'real-time-pnr-status-api-for-indian-railways.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
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
