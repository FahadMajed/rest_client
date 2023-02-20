import 'dart:core';
import 'dart:io';

import 'package:rest_api/exceptions.dart';

enum RESTOption { get, post, patch, delete, put }

abstract class RESTClient<R> {
  final String baseUrl;
  final String privateKey;
  final String publicKey;
  final Map<String, String> headers;
  RESTClient({
    required this.baseUrl,
    this.privateKey = "",
    this.publicKey = "",
    required this.headers,
  });

  Future<R> get(
    String path, {
    Map<String, String>? headers,
  });

  Future<R> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<R> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<R> patch(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<R> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<Map> call(
    RESTOption option, {
    required String path,
    Map<String, String>? headers,
    Object? body,
  }) async {
    Map responseAsMap;
    R response;
    try {
      switch (option) {
        case RESTOption.get:
          response = await get(
            path,
            headers: headers,
          );
          break;
        case RESTOption.post:
          response = await post(
            path,
            headers: headers,
            body: body,
          );
          break;
        case RESTOption.patch:
          response = await patch(
            path,
            headers: headers,
            body: body,
          );
          break;
        case RESTOption.delete:
          response = await delete(
            path,
            headers: headers,
            body: body,
          );
          break;
        case RESTOption.put:
          response = await put(
            path,
            headers: headers,
            body: body,
          );
          break;
      }

      responseAsMap = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseAsMap;
  }

  Map returnResponse(R response);
}
