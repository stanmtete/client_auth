import 'package:flutter/material.dart';
import '../controllers/includes.dart';

class SubmitButton extends StatelessWidget {
  final Function handleOnPressed;
  final String btnLabel;
  const SubmitButton(
      {required this.handleOnPressed, required this.btnLabel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          handleOnPressed();
        },
        child: Text(btnLabel),
        style: buttonStyle,
      ),
    );
  }
}
