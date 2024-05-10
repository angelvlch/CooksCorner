import 'package:cooks_corner/features/authorization/presentation/authorization_screen.dart';
import 'package:cooks_corner/features/registration/presentation/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:cooks_corner/core/routes/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  Map<String, WidgetBuilder> get _routes {
    return {
      Routes.authorization: (context) => const AuthorizationScreen(),
      Routes.registration: (context) => const RegistrationScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
    );
  }
}
