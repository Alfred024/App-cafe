import 'package:app_cafe/features/auth/domain/domain.dart';
import 'package:app_cafe/features/auth/infrastructure/datasources/auth_datasource_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({AuthDataSource? authDataSource})
      : authDataSource = authDataSource ?? AuthDataSourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return authDataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return authDataSource.login(email, password);
  }

  @override
  Future<User> register(
      String fullname, String email, String password1, String password2) {
    return authDataSource.register(fullname, email, password1, password2);
  }
}
