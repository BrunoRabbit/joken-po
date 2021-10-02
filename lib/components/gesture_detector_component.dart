import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GestureDetectorComponent extends StatelessWidget {
  void Function() onTap;
  String appImage;

  // ignore: use_key_in_widget_constructors
  GestureDetectorComponent({
    required this.onTap,
    required this.appImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Image.asset(
        appImage,
        height: 100,
      ),
    );
  }
}
