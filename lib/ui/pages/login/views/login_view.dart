import 'package:flutter/material.dart';
import 'package:flutter_basico_uni/ui/global_widgets/dialog.dart';
import 'package:flutter_basico_uni/ui/pages/login/login_controller.dart';

import '../../../global_widgets/global_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = LoginController();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    print("Ejecutando initState");
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  login() async {
    loadingDialog(context);
    final response = await controller.login(_emailController.text, _passwordController.text);
    if (mounted) {
      Navigator.pop(context);
    }

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
      Navigator.pushReplacementNamed(context, "/homeView");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Ejecutando Build");
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                    "Inicio de sesiòn",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Text("Por favor ingrese sus credenciales para continuar"),
                  const SizedBox(height: 40),
                  InputGenery(controller: _emailController),
                  const SizedBox(height: 15),
                  InputGenery(
                    controller: _passwordController,
                    hintText: "Contraseña",
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock),
                    suffix: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Olvidala"), SizedBox(height: 5)],
                    ),
                  ),
                  const SizedBox(height: 50),
                  BtnApp(onPressed: login),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/registerView");
                    },
                    child: const SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "¿No tienes cuenta?, Crea una",
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
