import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        "${options.method} | ${options.baseUrl}  | ${options.headers} | ${options.path} | ${options.uri} | ${options.data}");
    super.onRequest(options, handler); //add this line
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
    print('<<<<<<<<<<<<<>>>>>>>>>><<<');
    print(err.response?.statusCode ?? 'no hay sttaus code');
    super.onError(err, handler); //add this line
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.statusCode);
    super.onResponse(response, handler);
  }
}
