import 'package:app_cafe/config/config.dart';
import 'package:app_cafe/features/auth/domain/domain.dart';
import 'package:app_cafe/features/auth/infrastructure/infrastructure.dart';
import 'package:dio/dio.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  final baseUrl = '/auth';

  @override
  Future<User> checkAuthStatus(String token) {
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio
          .post('$baseUrl/login', data: {'email': email, 'password': password});

      final user = UserMapper.jsonToEntity(response.data);
      return user;
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        throw CustomError(message: 'Unvalid credentials', errorCode: 401);
      }
      if (error.type == DioExceptionType.connectionTimeout) {
        throw CustomError(message: 'Connection Timeout', errorCode: 408);
      }
      if (error.response?.statusCode == 500) {
        // INternal server error
        throw CustomError(
            message: 'Sorry we having problems. Please try later',
            errorCode: 401);
      }
      throw CustomError(
        message: 'Error at login request',
        errorCode: error.response?.statusCode,
      );
    }
  }

  @override
  Future<User> register(String email, String password, String fullname) {
    throw UnimplementedError();
  }
}
