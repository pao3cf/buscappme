
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:buscappme/routes/routes.dart';
import 'package:buscappme/domain/services/snackbar_service.dart';
import 'package:buscappme/domain/providers/login_provider.dart';
import 'domain/services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      scaffoldMessengerKey: SnackbarService.msgkey,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rVERIFY,
    );
  }
}