import 'package:flutter_basico_uni/data/models/user_model.dart';
import 'package:flutter_basico_uni/data/services/user_services.dart';

class HomeController {
  Future<UserModel?> getDataUser(String? idUser) async {
    if (idUser == null) return null;
    try {
      final userService = UserService();

      final dataUser = await userService.get(idUser);
      if (dataUser.isNotEmpty) {
        return UserModel.fromJson(dataUser);
      }
      return null;
    } catch (e) {
      print("ERROR AL TRAER EL USER: $e");
      return null;
    }
  }
}
