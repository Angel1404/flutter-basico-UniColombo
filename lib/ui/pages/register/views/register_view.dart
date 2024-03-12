import 'package:flutter/material.dart';
import 'package:flutter_basico_uni/ui/pages/register/register_controller.dart';

import '../../../global_widgets/dialog.dart';
import '../../../global_widgets/global_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final controller = RegisterController();

  //Crear los controller de los inputs de Fullname, email, password y confirmar password
  late final TextEditingController _emailController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  //Crear el metodo initState para asignarle el valor a los controller de los inputs
  //TODO: tomar de ejemplo lo que se hizo con la pantalla de login
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  register() async {
    //Colocar el dialogo de carga
    loadingDialog(context);

    final response = await controller.register(
      _emailController.text,
      _fullNameController.text,
      _passwordController.text,
      _confirmPasswordController.text,
    );
    //Cerrar el dialogo de carga
    if (mounted) {
      Navigator.pop(context);
    }

    //Validar que el response no tenga error con el atriuto response.isError
    //Si hay error mostrar el snackbar que esta en la pantalla de login con el error
    //si no hay error navegar a la pantalla de Home
    if (response.isError && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Column(
            children: [
              const Text("A ocurrido un error"),
              Text("El error es:  ${response.errorMessage}"),
            ],
          ),
        ),
      );
      return;
    }
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/homeView", arguments: response.data);
    }
  }

  bool isOscureText = true;

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
                  InputGenery(
                    hintText: "Nombre completo",
                    prefixIcon: const Icon(Icons.person),
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 15),
                  InputGenery(controller: _emailController),
                  const SizedBox(height: 15),
                  InputGenery(
                    obscureText: isOscureText,
                    hintText: "Contraseña",
                    prefixIcon: const Icon(Icons.lock),
                    controller: _passwordController,
                    suffix: _visiilityPassword(),
                  ),
                  const SizedBox(height: 15),
                  InputGenery(
                    obscureText: isOscureText,
                    hintText: "Confirmar contraseña",
                    prefixIcon: const Icon(Icons.lock),
                    controller: _confirmPasswordController,
                    suffix: _visiilityPassword(),
                  ),
                  const SizedBox(height: 50),
                  BtnApp(title: "Crear cuenta", onPressed: register),
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

  Widget _visiilityPassword() {
    return InkWell(
      onTap: () {
        isOscureText = !isOscureText;
        setState(() {});
      },
      child: Icon(isOscureText ? Icons.visibility_off : Icons.visibility),
    );
  }
}
