import 'package:flutter_basico_uni/data/models/base_response.dart';
import 'package:flutter_basico_uni/data/models/user_model.dart';
import 'package:flutter_basico_uni/data/services/auth_service.dart';
import 'package:flutter_basico_uni/data/services/user_services.dart';

class RegisterController {
  Future<BaseResponse> register(String email, String fullName, String password, String confimPassword) async {
    //1 validacion: verificar que los datos no sean nulos o vacios
    //Si son vacios retornar un BaseResponse.errorString(), con el mensaje de error.
    //2 validacion: verificar que las contraseñas sean iguales
    //Si no son iguales retornar un BaseResponse.errorString(), con el mensaje de error.

    try {
      final authService = AuthService();
      final userService = UserService();

      final response = await authService.register(email, password);
      if (response != null) {
        final userModel = UserModel(fullName: fullName, email: email, createdAt: DateTime.now().toString());
        userService.create(userModel.toMap());
      }
      return BaseResponse(isError: response == null, errorMessage: "No se pudo crear el usuario, consulte con admin");
    } catch (e) {
      return BaseResponse.errorString(e.toString());
    }
  }
}
