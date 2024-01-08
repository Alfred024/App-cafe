import 'package:app_cafe/features/auth/domain/domain.dart';
import 'package:app_cafe/features/auth/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();

  return AuthStateNotifier(authRepository: authRepository);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthStateNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (error) {
      logout(error.message);
    } catch (error) {
      logout('Not handled error');
    }
  }

  Future<void> logout([String? errorMessage]) async {
    state = state.copyWith(
      user: null,
      authStatus: AuthStatus.notAuthenticated,
      errorMessage: errorMessage,
    );
  }

  Future<void> _setLoggedUser(User user) async {
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final User? user;
  final AuthStatus authStatus;
  final String errorMessage;

  AuthState(
      {this.user,
      this.authStatus = AuthStatus.checking,
      this.errorMessage = ''});

  AuthState copyWith({
    User? user,
    AuthStatus? authStatus,
    String? errorMessage,
  }) =>
      AuthState(
        user: user ?? this.user,
        authStatus: authStatus ?? this.authStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
