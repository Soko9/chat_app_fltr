import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/firebase_options.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Chat',
      theme: ThemeData(fontFamily: 'sans-serif-condensed'),
      initialRoute: WelcomeScreen.routeID,
      routes: {
        WelcomeScreen.routeID: (context) => const WelcomeScreen(),
        LoginScreen.routeID: (context) => const LoginScreen(),
        RegistrationScreen.routeID: (context) => const RegistrationScreen(),
        ChatScreen.routeID: (context) => const ChatScreen(),
      },
    );
  }
}
