import 'package:flash_chat/widgets/message_stream.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const String routeID = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  User? loggedUser;
  final _messageController = TextEditingController();

  void getUser() {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        setState(() {
          loggedUser = user;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.door_back_door_rounded),
            iconSize: kIconSize,
            color: Colors.white,
            padding: const EdgeInsets.only(right: 12.0),
          ),
        ],
        title: Row(
          children: [
            Hero(
              tag: kLogoTag,
              child: SizedBox(
                height: kLogoSizeSmall,
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
            ),
            Text(
              '${loggedUser?.email}',
              style: kButtonTextStyle.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(
              stream: _firestore
                  .collection(kCollectionName)
                  .orderBy(kFieldTime)
                  .snapshots(),
              user: loggedUser,
            ),
            Container(
              padding: const EdgeInsets.only(left: 12.0),
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: kMessageTextFieldDecoration,
                      style: kMessageTextfieldTextStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 1.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        try {
                          await _firestore.collection(kCollectionName).add({
                            kFieldSender: loggedUser?.email,
                            kFieldText: _messageController.text,
                            kFieldTime: FieldValue.serverTimestamp(),
                          });
                        } catch (e) {
                          debugPrint(e.toString());
                        } finally {
                          _messageController.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
