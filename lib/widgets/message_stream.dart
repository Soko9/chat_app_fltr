import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/utils/constants.dart';
import 'package:flash_chat/widgets/bubble.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
    required this.stream,
    required this.user,
  });

  final Stream<QuerySnapshot> stream;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.black.withAlpha(128),
            ),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return Expanded(
            child: Center(
              child: Image.asset('images/emptyspace.jpg'),
            ),
          );
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.docs.reversed
                .map((QueryDocumentSnapshot document) {
              Map<String, dynamic> dt =
                  document.data()! as Map<String, dynamic>;
              return Bubble(
                dt: dt,
                isMe: user!.email == dt[kFieldSender],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
