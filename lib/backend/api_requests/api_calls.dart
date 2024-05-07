import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Test API Group Code

class TestAPIGroup {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static Map<String, String> headers = {};
  static PostsCall postsCall = PostsCall();
  static UsersCall usersCall = UsersCall();
}

class PostsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Posts',
      apiUrl: '${TestAPIGroup.baseUrl}/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UsersCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Users',
      apiUrl: '${TestAPIGroup.baseUrl}/users',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Test API Group Code

class WorldNewsENCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'World News EN',
      apiUrl:
          'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fnews.google.com%2Frss%2Ftopics%2FCAAqJggKIiBDQkFTRWdvSUwyMHZNRGx1YlY4U0FtVnVHZ0pWVXlnQVAB%3Fhl%3Den-US%26gl%3DUS%26ceid%3DUS%253Aen',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic worldNewsFeed(dynamic response) => getJsonField(
        response,
        r'''$.feed''',
      );
  static List<String>? worldNewsTitles(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? worldNewsDescriptions(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BangladeshNewsBNCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Bangladesh News BN',
      apiUrl:
          'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fnews.google.com%2Frss%2Ftopics%2FCAAqIQgKIhtDQkFTRGdvSUwyMHZNREUyTW1JU0FtSnVLQUFQAQ%3Fhl%3Dbn%26gl%3DBD%26ceid%3DBD%253Abn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic bangladeshNewsFeed(dynamic response) => getJsonField(
        response,
        r'''$.feed''',
      );
  static List<String>? bangladeshNewsTitle(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? bangladeshNewsDescription(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? bangladeshNewsLink(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class WorldNewsBNCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'World News BN',
      apiUrl:
          'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fnews.google.com%2Frss%2Ftopics%2FCAAqJggKIiBDQkFTRWdvSUwyMHZNRGx1YlY4U0FtSnVHZ0pDUkNnQVAB%3Fhl%3Dbn%26gl%3DBD%26ceid%3DBD%253Abn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic worldNewsFeedBN(dynamic response) => getJsonField(
        response,
        r'''$.feed''',
      );
  static List<String>? worldNewsTitleBN(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? worldNewsDescriptionBN(dynamic response) =>
      (getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? worldNewsLinkBN(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
