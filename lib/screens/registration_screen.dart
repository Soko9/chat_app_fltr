import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/utils/constants.dart';
import 'package:flash_chat/widgets/flash_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String routeID = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                      decoration: kRegisterTextFieldDecoration.copyWith(
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
                      decoration: kRegisterTextFieldDecoration.copyWith(
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
                                await _auth.createUserWithEmailAndPassword(
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
                            color: kRegisterColor,
                            child: const Text(
                              'register',
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
                                  context, LoginScreen.routeID);
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
