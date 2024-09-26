import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  const CustomImage(
      {super.key,
      required this.image,
      this.height,
      required this.boxFit,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: height ?? 300,
      width: width ?? 300,
      fit: boxFit,
    );
  }
}
