import 'package:dio/dio.dart';
import 'package:rest_api/exceptions.dart';
import 'package:rest_api/rest_client.dart';

class DioRESTClient extends RESTClient<Response> {
  late final Dio dio;

  DioRESTClient({
    required super.baseUrl,
    super.privateKey,
    super.publicKey,
    required super.headers,
  }) {
    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers));
  }

  @override
  Future<Response> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await dio.delete(
        path,
        data: body,
        options: Options(headers: headers),
      );

  @override
  Future<Response> get(
    String path, {
    Map<String, String>? headers,
  }) async =>
      await dio.get(
        path,
        options: Options(headers: headers),
      );

  @override
  Future<Response> patch(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await dio.patch(
        path,
        data: body,
        options: Options(headers: headers),
      );

  @override
  Future<Response> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await dio.post(
        path,
        data: body,
        options: Options(headers: headers),
      );

  @override
  Future<Response> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async =>
      await dio.put(
        path,
        data: body,
        options: Options(headers: headers),
      );

  @override
  Map returnResponse(response) {
    final body = response.data;

    switch (response.statusCode) {
      case 200:
        return body;
      case 201:
        return body;
      case 202:
        return body;
      case 204:
        return body;
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
