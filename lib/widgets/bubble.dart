import 'package:flutter/material.dart';
import 'package:flash_chat/utils/constants.dart';

class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    required this.dt,
    required this.isMe,
  });

  final Map<String, dynamic> dt;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMe ? 100.0 : 0,
        6.0,
        isMe ? 0 : 100.0,
        6.0,
      ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          isMe
              ? Container()
              : Text(
                  '${dt[kFieldSender]}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black45,
                  ),
                ),
          const SizedBox(
            height: 4.0,
          ),
          Material(
            color: isMe ? kRegisterColor : kLogInColor,
            elevation: 2.0,
            borderRadius: BorderRadius.only(
              topLeft:
                  isMe ? const Radius.circular(12.0) : const Radius.circular(0),
              topRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(12.0),
              bottomLeft: const Radius.circular(12.0),
              bottomRight: const Radius.circular(12.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: Text(
                '${dt[kFieldText]}',
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
