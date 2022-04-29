import 'package:flutter/material.dart';

class TextButtonSection extends StatelessWidget {
  final String textLeading, textTail;

  final String routeName;
  const TextButtonSection(
      {required this.textLeading,
      required this.textTail,
      required this.routeName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(textLeading),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Text(
            textTail,
          ),
        ),
      ],
    );
  }
}
