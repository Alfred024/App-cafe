import 'package:app_cafe/features/auth/domain/domain.dart';
import 'package:app_cafe/features/auth/infrastructure/infrastructure.dart';
import 'package:app_cafe/features/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  return AuthStateNotifier(
      authRepository: authRepository,
      keyValueStorageService: keyValueStorageService);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthStateNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

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

  Future<void> registerUser(
      String fullName, String email, String password1, String password2) async {
    try {
      final user =
          await authRepository.register(fullName, email, password1, password2);
      _setRegistereddUser(user);
    } on CustomError catch (error) {
      notRegister(error.message);
    } catch (error) {
      notRegister('Not handled error');
    }
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
      user: null,
      //authStatus: AuthStatus.notAuthenticated,
      authStatus: AuthStatus.authenticated,
      errorMessage: errorMessage,
    );
  }

  Future<void> checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');
    if (token == null) return logout();

    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
    } on CustomError catch (error) {
      logout(error.message);
    } catch (error) {
      logout('Not handled error');
    }
  }

  Future<void> notRegister([String? errorMessage]) async {
    state = state.copyWith(
      user: null,
      authStatus: AuthStatus.notValidated,
      errorMessage: errorMessage,
    );
  }

  Future<void> _setLoggedUser(User user) async {
    print('TOKEN: ' + user.token);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  // TODO: Mandar correo de confirmación y manejar cómo se manda el usuario
  Future<void> _setRegistereddUser(User user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.validated,
      errorMessage: '',
    );
  }
}

// 'validated' para cuando un usuario se registra exitosamente y debe confirmar su correo
enum AuthStatus {
  checking,
  authenticated, //login method
  notAuthenticated, //login method
  validated, //register method
  notValidated, //register method
}

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
