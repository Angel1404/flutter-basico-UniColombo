import 'package:flutter/material.dart';

import '../../../global_widgets/global_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: const StackCicleCard(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inicio de sesiòn",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text("Por favor ingrese sus credenciales para continuar"),
                  SizedBox(height: 40),
                  InputGenery(),
                  SizedBox(height: 15),
                  InputGenery(
                    hintText: "Contraseña",
                    prefixIcon: Icon(Icons.lock),
                    suffix: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Olvidala"), SizedBox(height: 5)],
                    ),
                  ),
                  SizedBox(height: 50),
                  BtnApp()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
