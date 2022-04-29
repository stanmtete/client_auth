import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String content;
  final Icon icon;

  const DrawerListTile({required this.content, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(content),
      iconColor: Theme.of(context).primaryColor,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(content),
            action: SnackBarAction(
              label: 'Exit',
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ),
          ),
        );
      },
    );
  }
}
