import 'dart:convert';
import 'package:dio/dio.dart';

// call api
abstract class RemoteDataSource {
  Future<Response> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> get(
    String url, {
    Map<String, String>? headers,
    bool? addToken,
    Options? options,
    Map<String, dynamic>? queryParameters,
    // ResponseType? responseType,
  });

  Future<Response> patch(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
  });

  Future<Response> put(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
  });

  Future<Response> delete(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
  });
}

class RemoteDataSourceImpl extends RemoteDataSource {
  RemoteDataSourceImpl({
    required this.baseUrl,
    this.headers = const {
      'Content-Type': 'application/json',
    },
    required this.dio,
  });

  String baseUrl;
  Map<String, String> headers;
  Dio dio;

  @override
  Future<Response> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      '$baseUrl/$url',
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers ?? this.headers,
      ),
    );
  }

  @override
  Future<Response> get(
    String url, {
    Map<String, String>? headers,
    bool? addToken,
    Options? options,
    Map<String, dynamic>? queryParameters,
    // ResponseType? responseType,
  }) async {
    return await dio.get(
      '$baseUrl/$url',
      queryParameters: queryParameters,
      options: options ??
          Options(
            headers: headers ?? this.headers,
          ),
    );
  }

  @override
  Future<Response> patch(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
  }) async {
    return await dio.patch(
      '$baseUrl/$url',
      data: body,
      options: Options(
        headers: headers ?? this.headers,
      ),
    );
  }

  @override
  Future<Response> put(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
  }) async {
    return await dio.put(
      '$baseUrl/$url',
      data: body,
      options: Options(
        headers: headers ?? this.headers,
      ),
    );
  }

  @override
  Future<Response> delete(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Encoding? encoding,
    bool? addToken,
  }) async {
    return await dio.delete(
      '$baseUrl/$url',
      options: Options(
        headers: headers ?? this.headers,
      ),
    );
  }
}
