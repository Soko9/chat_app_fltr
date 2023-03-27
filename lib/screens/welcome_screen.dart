import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/utils/constants.dart';
import 'package:flash_chat/widgets/flash_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String routeID = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = ColorTween(
      begin: Colors.white,
      end: Colors.amber[700],
    ).animate(controller!);

    controller!.forward();

    animation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller!.forward();
      }
    });

    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: kLogoTag,
                  child: SizedBox(
                    height: kLogoSizeSmall,
                    child: Image.asset(
                      'images/logo.png',
                      color: animation!.value,
                    ),
                  ),
                ),
                const Text(
                  'LASH CHAT',
                  style: kLogoTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: kLogoMargin,
            ),
            FlashButton(
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.routeID);
              },
              color: kLogInColor,
              child: const Text(
                'login',
                style: kButtonTextStyle,
              ),
            ),
            FlashButton(
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.routeID);
              },
              color: kRegisterColor,
              child: const Text(
                'register',
                style: kButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
