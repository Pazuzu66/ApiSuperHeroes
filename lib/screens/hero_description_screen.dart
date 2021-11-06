import 'package:apisuperhero/widgets/description_view.dart';
import 'package:flutter/material.dart';

class HeroDescriprionScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 31, 52),
      appBar: AppBar(
        title: Text('Description'),        
      ),
      body: DescriptionView(),
    );
  }
}