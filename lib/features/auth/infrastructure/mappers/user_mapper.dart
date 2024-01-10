import 'package:app_cafe/features/auth/domain/domain.dart';

//TODO: Revisar la respuesta que manda la API para saber cómo mapear los datos

// En el registro, también regresa un token???
class UserMapper {
  static User jsonToLoginUsirEntity(Map<String, dynamic> json) => User(
        email: json['email'],
        password: json['password'],
        token: json['token'],
      );

  static User jsonToRegisterUsirEntity(Map<String, dynamic> json) => User(
        fullName: json['fullName'],
        email: json['email'],
        password: json['password1'],
        token: json['token'],
      );
}
