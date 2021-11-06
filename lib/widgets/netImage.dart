import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NetImage extends StatelessWidget {
  String url;
  
  NetImage({
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(url,);
  }
}