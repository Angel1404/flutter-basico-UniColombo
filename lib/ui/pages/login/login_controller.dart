import 'package:flutter_basico_uni/data/services/auth_service.dart';

import '../../../data/models/base_response.dart';

class LoginController {
  Future<BaseResponse<String?>> login(String email, String password) async {
    if (email.isEmpty) {
      return BaseResponse.errorString("El correo es incorrecto");
    }

    if (password.isEmpty) {
      return BaseResponse.errorString("La contraseña es incorrecta");
    }
    try {
      final authService = AuthService();
      final idUser = await authService.login(email, password);
      if (idUser != null) {
        return BaseResponse(data: idUser);
      }
      return BaseResponse.errorString("No se pudo crear el usuario, consulte con admin");
    } catch (e) {
      return BaseResponse.errorString(e.toString());
    }
  }
}
