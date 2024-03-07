import 'package:flutter/material.dart';
import 'package:flutter_basico_uni/ui/pages/home/views/home_view.dart';
import 'package:flutter_basico_uni/ui/pages/pages.dart';
import 'package:flutter_basico_uni/ui/pages/register/views/register_view.dart';

final routesApp = {
  "/loginView": (BuildContext context) => const LoginView(),
  "/registerView": (BuildContext context) => const RegisterView(),
  "/homeView": (BuildContext context) => const HomeView(),
};
