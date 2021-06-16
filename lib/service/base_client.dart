import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_http_client/service/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION = 20;
  // GET
  Future<dynamic> get({required String baseUrl, required String api}) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responding in time', url: uri.toString());
    }
  }
  // POST

  Future<dynamic> post(
      {required String baseUrl,
      required String api,
      required dynamic payloadObj}) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responding in time', url: uri.toString());
    }
  }
  // DELETE
  // OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            message: utf8.decode(response.bodyBytes),
            url: response.request?.url.toString());
      case 401:
        throw UnAuthorizedException(
            message: utf8.decode(response.bodyBytes),
            url: response.request?.url.toString());
      case 403:
        throw UnAuthorizedException(
            message: utf8.decode(response.bodyBytes),
            url: response.request?.url.toString());
      case 500:
        throw FetchDataException(
            message: 'Error occurred with code: ${response.statusCode}',
            url: response.request?.url.toString());
      default:
    }
  }
}
