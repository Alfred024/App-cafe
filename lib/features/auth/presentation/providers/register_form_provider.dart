import 'package:app_cafe/features/auth/presentation/providers/auth_provider.dart';
import 'package:app_cafe/features/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final registerFormProvider =
    StateNotifierProvider<RegisterFormNotifier, RegisterFormState>((ref) {
  final registerUserCallback =
      ref.read(authNotifierProvider.notifier).registerUser;
  return RegisterFormNotifier(registerUserCallback: registerUserCallback);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String, String, String) registerUserCallback;

  RegisterFormNotifier({required this.registerUserCallback})
      : super(RegisterFormState());

  onNameChanged(String value) {
    final newName = Name.dirty(value);
    state = state.copyWith(
        name: newName,
        isValid: Formz.validate([
          newName,
          state.email,
          state.password1,
          state.password2,
        ]));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate([
          newEmail,
          state.name,
          state.password1,
          state.password2,
        ]));
  }

  onPassword1Changed(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password1: newPassword,
        isValid: Formz.validate(
            [newPassword, state.password2, state.name, state.email]));
  }

  onPassword2Changed(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password2: newPassword,
        isValid: Formz.validate(
            [newPassword, state.password1, state.name, state.email]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;

    await registerUserCallback(state.name.value, state.email.value,
        state.password1.value, state.password2.value);
  }

  _touchEveryField() {
    final name = Name.dirty(state.name.value);
    final email = Email.dirty(state.email.value);
    final password1 = Password.dirty(state.password1.value);
    final password2 = Password.dirty(state.password2.value);

    state = state.copyWith(
        isFormPosted: true,
        name: name,
        email: email,
        password1: password1,
        password2: password2,
        isValid: Formz.validate([name, email, password1, password2]));
  }
}

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Name name;
  // final Name first_lastname;
  // final Name second_lastname;
  final Email email;
  final Password password1;
  final Password password2;

  RegisterFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.name = const Name.pure(),
      this.email = const Email.pure(),
      this.password1 = const Password.pure(),
      this.password2 = const Password.pure()});

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Name? name,
    Email? email,
    Password? password1,
    Password? password2,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        name: name ?? this.name,
        email: email ?? this.email,
        password1: password1 ?? this.password1,
        password2: password2 ?? this.password2,
      );

  @override
  String toString() {
    return '''
  RegisterFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    name: $name
    email: $email
    password: $password1
''';
  }
}
