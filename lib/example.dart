import 'package:flutter/material.dart';

String example = "example";

gg({String? name}) {
  example = "4554";
}

Future<String> restApi() async {
  return "Hola";
}

class Example {
  consumirApi() async {
    final model = ExampleModel(description: "Esto es una descripcion", name: "Esto es un nombre ");
    try {
      final response = await restApi();
      model.description = "lo que yo quiera";
      model.name;
      print(response);
    } catch (e) {
      print(e);
    }
  }
}

class ExampleModel {
  final String name;
  String description;

  ExampleModel({required this.name, required this.description});
}

int entero = 1223423746347856534;
double decimales = 3;
String texto = " ";
bool boleano = false;
dynamic dinamico = 123;

List<String> lista = [];
final lista2 = [ExampleModel(name: "name", description: "")];

Map mapas = {};
final maps2 = {"example": true, "example2": "Prueba"};

DateTime date = DateTime.now();
final date2 = DateTime.now();

addExample() {
  lista.add("true");
  mapas["example3"] = false;
  mapas.addAll({"jdhdjd": "true"});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          Container(
                            // Este es el contenido fijo detrás del formulario.
                            color: Colors.white,
                            height: 120.0,
                          ),
                          Expanded(
                            // El formulario se desplazará dentro de este espacio flexible.
                            child: Container(
                              color: Colors.blue,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.red[100],
                                      child: const SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  // Agrega más elementos posicionados según tus necesidades.
                                  // Por ejemplo, aquí he agregado algunos contenedores de colores diferentes.
                                  Positioned(
                                    top: 50,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.red[200],
                                      child: const SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  // ... Agrega más elementos según sea necesario.
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
