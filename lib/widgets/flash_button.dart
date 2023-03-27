import 'package:flutter/material.dart';
import 'package:flash_chat/utils/constants.dart';

class FlashButton extends StatelessWidget {
  const FlashButton({
    super.key,
    required this.onPress,
    required this.color,
    required this.child,
    this.radius,
  });

  final VoidCallback onPress;
  final Color color;
  final Widget? child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kButtonMargin),
      child: Material(
        elevation: 2.0,
        color: color,
        borderRadius: BorderRadius.circular(radius ?? kRadius),
        child: MaterialButton(
          onPressed: onPress,
          padding: const EdgeInsets.all(0),
          height: kHeight,
          child: Center(child: child),
        ),
      ),
    );
  }
}
