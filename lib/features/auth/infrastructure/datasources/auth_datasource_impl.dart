import 'package:app_cafe/config/config.dart';
import 'package:app_cafe/features/auth/domain/domain.dart';
import 'package:app_cafe/features/auth/infrastructure/infrastructure.dart';
import 'package:dio/dio.dart';

import '../interceptors/api_interceptors.dart';

class AuthDataSourceImpl implements AuthDataSource {
  Dio? dio;

  AuthDataSourceImpl() {
    dio = Dio(BaseOptions(
      baseUrl: Environment.apiUrl,
      //baseUrl: 'http://localhost:3000/api',
      connectTimeout: const Duration(milliseconds: 8000),
      receiveTimeout: const Duration(milliseconds: 8000),
    ));
    _initializeInterceptors();
  }

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio?.post('/auth/check-status',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final user = UserMapper.jsonToLoginUsirEntity(response?.data);
      return user;
    } on DioException catch (error) {
      throw _handleAuthErrors(error, 'checking authentication status');
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      print('Tryng to login');
      final response = await dio
          ?.post('/auth/login', data: {'email': email, 'password': password});
      final user = UserMapper.jsonToLoginUsirEntity(response?.data);
      return user;
    } on DioException catch (error) {
      throw _handleAuthErrors(error, 'login');
    }
  }

  @override
  Future<User> register(
      String fullName, String email, String password1, String password2) async {
    if (password1 != password2) {
      throw CustomError(message: 'The passwords dont match', errorCode: 401);
    }

    try {
      final response = await dio?.post('/auth/register', data: {
        'fullName': fullName,
        'email': email,
        'password1': password1,
        'password2': password2,
      });
      final newUser = UserMapper.jsonToRegisterUsirEntity(response?.data);
      return newUser;
    } on DioException catch (error) {
      throw _handleAuthErrors(error, 'register');
    }
  }

  CustomError _handleAuthErrors(DioException error, String method) {
    if (error.response?.statusCode == 401) {
      return CustomError(message: 'Unvalid credentials', errorCode: 401);
    }
    if (error.type == DioExceptionType.connectionTimeout) {
      return CustomError(message: 'Connection Timeout', errorCode: 408);
    }
    if (error.response?.statusCode == 500) {
      // INternal server error
      return CustomError(
          message: 'Sorry we having problems. Please try later',
          errorCode: 401);
    }
    return CustomError(
      message: 'Error at $method request',
      errorCode: error.response?.statusCode,
    );
  }

  _initializeInterceptors() {
    dio?.interceptors.add(ApiInterceptors());
  }
}
