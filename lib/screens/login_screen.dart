import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/utils/constants.dart';
import 'package:flash_chat/widgets/flash_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeID = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool isLoading = false;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        blur: 5.0,
        progressIndicator: Container(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Hero(
                      tag: kLogoTag,
                      child: SizedBox(
                        height: kLogoSizeBig,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                    const SizedBox(
                      height: kLogoMargin,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: kLoginTextFieldDecoration.copyWith(
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(
                      height: kTextFieldMargin,
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                      decoration: kLoginTextFieldDecoration.copyWith(
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(
                      height: kButtonMargin,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: FlashButton(
                            onPress: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                await _auth.signInWithEmailAndPassword(
                                    email: email!, password: password!);
                                if (!mounted) return;
                                Navigator.pushNamed(
                                    context, ChatScreen.routeID);
                              } catch (e) {
                                debugPrint(e.toString());
                              } finally {
                                setState(() {
                                  email = null;
                                  password = null;
                                  isLoading = false;
                                });
                              }
                            },
                            color: kLogInColor,
                            child: const Text(
                              'login',
                              style: kButtonTextStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: kButtonMargin,
                        ),
                        Expanded(
                          child: FlashButton(
                            onPress: () {
                              Navigator.popAndPushNamed(
                                  context, RegistrationScreen.routeID);
                            },
                            color: Colors.grey,
                            child: const Icon(
                              Icons.signpost_sharp,
                              color: Colors.white,
                              size: kIconSize + 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
