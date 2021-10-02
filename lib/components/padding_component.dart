import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaddingComponent extends StatelessWidget {
  String texto;

  // ignore: use_key_in_widget_constructors
  PaddingComponent({
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
