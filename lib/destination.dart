import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  final String imagePath;

  DestinationScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicios en casa'),
      ),
      body: Center(
        child: Container(
          key: key,
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height - 200,
          width: MediaQuery.of(context).size.width - 50,
          child: Image.asset(imagePath),
        )
      ),
    );
  }
}
