import 'package:app_cafe/features/auth/domain/domain.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> register(
      String fullName, String email, String password1, String password2);
  Future<User> checkAuthStatus(String token);
}
