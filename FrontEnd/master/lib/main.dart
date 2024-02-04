import 'package:flutter/material.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator().whenComplete(() => runApp(Tela()));
}

class Tela extends StatelessWidget {
  Tela({super.key});

  /// Theme de l'application
  final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
        background: Colors.blueGrey.shade900,
        seedColor: const Color(0xFF0451b0)),
    // text Theme
    fontFamily: "Ubuntu",
  );


  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tela",
      theme: light,
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
