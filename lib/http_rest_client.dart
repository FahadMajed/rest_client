import 'dart:convert';

import 'package:rest_api/exceptions.dart';
import 'package:rest_api/rest_client.dart';
import 'package:http/http.dart' as http;

class HttpRESTClient extends RESTClient<http.Response> {
  HttpRESTClient({
    required super.baseUrl,
    super.privateKey,
    super.publicKey,
    required super.headers,
  });

  Uri _getResourcePath(String path) => Uri.parse(baseUrl + path);

  @override
  Future<http.Response> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await http.delete(
        _getResourcePath(path),
        headers: headers,
        body: body,
      );

  @override
  Future<http.Response> get(
    String path, {
    Map<String, String>? headers,
  }) async =>
      await http.get(
        _getResourcePath(path),
        headers: headers,
      );

  @override
  Future<http.Response> patch(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await http.patch(
        _getResourcePath(path),
        headers: headers,
        body: body,
      );

  @override
  Future<http.Response> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await http.post(
        _getResourcePath(path),
        headers: headers,
        body: body,
      );

  @override
  Future<http.Response> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await http.put(
        _getResourcePath(path),
        headers: headers,
        body: body,
      );

  @override
  Map returnResponse(response) {
    final body = response.body.toString();
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(body);
        return responseJson;
      case 201:
        final responseJson = json.decode(body);
        return responseJson;
      case 202:
        final responseJson = json.decode(body);
        return responseJson;
      case 204:
        final responseJson = json.decode(body);
        return responseJson;
      case 400:
        throw BadRequestException(body);
      case 401:
        throw UnauthorizedException(body);
      case 403:
        throw UnauthorizedException(body);
      case 404:
        throw NotFound(body);
      case 422:
        throw InvalidRequestException(body);
      case 429:
        throw TooManyRequests(body);
      case 502:
        throw BadGateway(body);
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
