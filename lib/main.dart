import 'package:flutter/material.dart';

import 'package:fast_chat/screens/welcome_screen.dart';
import 'package:fast_chat/screens/login_screen.dart';
import 'package:fast_chat/screens/registration_screen.dart';
import 'package:fast_chat/screens/chat_screen.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: WelcomeScreen(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        });
  }
}
