import 'package:app_cafe/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterNotifierProvider = Provider((ref) {
  final authStateNotifier = ref.read(authNotifierProvider.notifier);
  return AppRouterNotifier(authStateNotifier);
});

class AppRouterNotifier extends ChangeNotifier {
  final AuthStateNotifier _authStateNotifier;
  AuthStatus _authStatus = AuthStatus.checking;

  AppRouterNotifier(
    this._authStateNotifier,
  ) {
    _authStateNotifier.addListener((state) {
      _authStatus = state.authStatus;
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus authStatus) {
    _authStatus = authStatus;
    notifyListeners();
  }
}
