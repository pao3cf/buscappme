import 'package:buscappme/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // scaffoldMessengerKey: SnackbarService.msgkey,
      // onGenerateRoute: MyRoutes.generateRoute,
      // initialRoute: MyRoutes.rVERIFY,
      home: OnboardingPage(),
    );
  }
}
