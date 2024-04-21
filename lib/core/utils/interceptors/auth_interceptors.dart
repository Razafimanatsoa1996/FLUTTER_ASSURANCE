import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptors extends Interceptor {
  final SharedPreferences preferences;

  AuthInterceptors({
    required this.preferences,
  });

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final jwt = preferences.getString(/* SharedPreferencesKey.token */"");
    if (jwt != null) {
    if (!options.path.contains('login')) {
      options.headers['Authorization'] = 'Bearer $jwt';
      }
    }
    handler.next(options);
  }

  @override
  FutureOr<dynamic> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    handler.next(response);
  }
}
