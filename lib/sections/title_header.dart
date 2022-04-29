import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title, subtitle;

  const TitleHeader({required this.title, required this.subtitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          // Text(
          //   'Don\'t have an account? Register',
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
        ],
      ),
    );
  }
}
