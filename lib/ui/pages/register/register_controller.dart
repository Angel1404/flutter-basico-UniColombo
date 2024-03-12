import 'package:flutter_basico_uni/data/models/base_response.dart';
import 'package:flutter_basico_uni/data/models/user_model.dart';
import 'package:flutter_basico_uni/data/services/auth_service.dart';
import 'package:flutter_basico_uni/data/services/user_services.dart';

class RegisterController {
  Future<BaseResponse> register(String email, String fullName, String password, String confimPassword) async {
    //1 validacion: verificar que los datos no sean nulos o vacios
    if (email.isEmpty || fullName.isEmpty || password.isEmpty || confimPassword.isEmpty) {
      //Si son vacios retornar un BaseResponse.errorString(), con el mensaje de error.
      return BaseResponse.errorString("Todos los campos son requeridos");
    }
    //2 validacion: verificar que las contraseñas sean iguales
    if (confimPassword != password) {
      //Si no son iguales retornar un BaseResponse.errorString(), con el mensaje de error.
      return BaseResponse.errorString("Las contraseñas deben ser iguales");
    }

    try {
      final authService = AuthService();
      final userService = UserService();

      final idUser = await authService.register(email, password);
      if (idUser != null) {
        final userModel = UserModel(
          id: idUser,
          fullName: fullName,
          email: email,
          createdAt: DateTime.now().toString(),
        );
        await userService.create(userModel.toMap(), idUser);
        return BaseResponse(data: idUser);
      }
      return BaseResponse.errorString("No se pudo crear el usuario, consulte con admin");
    } catch (e) {
      return BaseResponse.errorString(e.toString());
    }
  }
}
