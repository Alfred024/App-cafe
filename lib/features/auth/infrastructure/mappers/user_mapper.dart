import 'package:app_cafe/features/auth/domain/domain.dart';

//TODO: Revisar la respuesta que manda la API para saber cómo mapear los datos
class UserMapper {
  static User jsonToEntity(Map<String, dynamic> json) => User(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password']);
}
