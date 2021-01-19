import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;

  LabelText(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label ?? "",
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16.0,
      ),
      textAlign: TextAlign.left,
    );
  }
}
