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
