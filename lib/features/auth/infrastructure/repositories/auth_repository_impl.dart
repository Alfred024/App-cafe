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
  Future<User> register(String email, String password, String fullname) {
    return authDataSource.register(email, password, fullname);
  }
}
