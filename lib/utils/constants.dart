import 'package:flutter/material.dart';

const kLogoTag = 'LOGO';

const kCollectionName = 'messages';
const kFieldText = 'text';
const kFieldSender = 'sender';
const kFieldTime = 'timestamp';

const kLogoSizeBig = 200.0;
const kLogoSizeSmall = 40.0;

const kIconSize = 32.0;

const kTextFieldMargin = 12.0;
const kButtonMargin = 20.0;
const kLogoMargin = 52.0;
const kHorizontalPadding = 24.0;

const kHeight = 42.0;
const kMinWidth = 200.0;
const kRadius = 8.0;

const kLogInColor = Colors.lightBlueAccent;
const kRegisterColor = Colors.blueAccent;

const kLogoTextStyle = TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.w500,
  letterSpacing: 6.0,
  color: Colors.amber,
);

const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 26.0,
  fontWeight: FontWeight.w700,
);

const kTextFieldTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
);

const kRegisterTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
);

const kLoginTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(kRadius)),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageTextfieldTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  color: Colors.black87,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.blue, width: 1.0),
  ),
);
