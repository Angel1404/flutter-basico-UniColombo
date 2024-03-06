import 'package:flutter/material.dart';

import '../../../global_widgets/global_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
