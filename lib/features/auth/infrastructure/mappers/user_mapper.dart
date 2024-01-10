import 'package:app_cafe/features/auth/domain/domain.dart';

//TODO: Revisar la respuesta que manda la API para saber cómo mapear los datos

// En el registro, también regresa un token???
class UserMapper {
  static User jsonToLoginUsirEntity(Map<String, dynamic> json) => User(
        email: json['email'],
        fullName: json['fullName'],
        role: json['role'],
        token: json['token'],
      );

  static User jsonToRegisterUsirEntity(Map<String, dynamic> json) => User(
        fullName: json['fullName'],
        email: json['email'],
        password: json['password1'],
        token: json['token'],
      );
}

// {
// 	"id": "a8c85038-d48f-40cd-a17e-43cc713026e9",
// 	"email": "21030761@itcelaya.edu.mx",
// 	"fullName": "Alfredo",
// 	"role": "client",
// 	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhOGM4NTAzOC1kNDhmLTQwY2QtYTE3ZS00M2NjNzEzMDI2ZTkiLCJpYXQiOjE3MDQ4NjAyNTZ9.7fNs0-DO9jBHqajR2ZNGXYafc4huJNpVWgZjaTmSDyw"
// }