import 'package:flutter/material.dart';
import 'package:flutter_basico_uni/ui/pages/register/register_controller.dart';

import '../../../global_widgets/global_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final controller = RegisterController();

  //Crear los controller de los inputs de Fullname, email, password y confirmar password

  //Crear el metodo initState para asignarle el valor a los controller de los inputs

  //TODO: tomar de ejemplo lo que se hizo con la pantalla de login

  register() async {
    //Colocar el dialogo de carga
    final response = await controller.register(email, fullName, password, confimPassword);
    //Cerrar el dialogo de carga

    //Validar que el response no tenga error con el atriuto response.isError
    //Si hay error mostrar el snackbar que esta en la pantalla de login con el error
    //si no hay error navegar a la pantalla de Home
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: StackCicleCard(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Crear cuenta",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const InputGenery(hintText: "Nombre completo", prefixIcon: Icon(Icons.person)),
                  const SizedBox(height: 15),
                  const InputGenery(),
                  const SizedBox(height: 15),
                  const InputGenery(hintText: "Contraseña", prefixIcon: Icon(Icons.lock)),
                  const SizedBox(height: 15),
                  const InputGenery(hintText: "Confirmar contraseña", prefixIcon: Icon(Icons.lock)),
                  const SizedBox(height: 50),
                  BtnApp(
                    title: "Crear cuenta",
                    onPressed: () {
                      Navigator.pushNamed(context, "/registerView");
                    },
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "¿Ya tienes cuenta?, inicia sesión",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
