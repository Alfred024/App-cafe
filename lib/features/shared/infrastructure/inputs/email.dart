import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  //Regular expressions that consist of a sequence of characters that specify a match-checking algorithm
  //To see the datail of the RegExp check this link: https://regexr.com/3e48o
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // pure represent an unmodified form input.
  const Email.pure() : super.pure('');

  // dirty represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) {
      return 'Este campo no puede estar vacío';
    }
    if (displayError == EmailError.format) {
      return 'El formato del correo no es correcto';
    }

    return null;
  }

  //To handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
