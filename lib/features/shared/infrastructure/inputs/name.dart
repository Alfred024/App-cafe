import 'package:formz/formz.dart';

enum NameError { empty, length, format }

class Name extends FormzInput<String, NameError> {
  static final RegExp nameRegExp = RegExp(
    r'^[a-zA-Z]{3,10}$',
  );
  // static final RegExp nameRegExp = RegExp(r"^[\p{L} ,.'-]*$",
  //     caseSensitive: false, unicode: true, dotAll: true);

  const Name.pure() : super.pure('');

  const Name.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NameError.empty) {
      return 'Este campo no puede estar vacío';
    }
    if (displayError == NameError.length) {
      return 'El campo debe tener al menos 3 caracteres';
    }
    if (displayError == NameError.format) {
      return 'El campo solo puede contener letras y no debe ser mayor a 10 caracteres';
    }
    return null;
  }

  @override
  NameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NameError.empty;
    if (value.length < 3) return NameError.length;
    if (!nameRegExp.hasMatch(value)) return NameError.format;
    return null;
  }
}
