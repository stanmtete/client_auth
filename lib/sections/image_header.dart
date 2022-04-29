import 'package:flutter/material.dart';

class ImageHeader extends StatelessWidget {
  final String imageURL;

  const ImageHeader(this.imageURL, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
