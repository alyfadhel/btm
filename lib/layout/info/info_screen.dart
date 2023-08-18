import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          'Info'
        ),
      ),
      body: Center(
        child: Text(
          'Info Screen',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
