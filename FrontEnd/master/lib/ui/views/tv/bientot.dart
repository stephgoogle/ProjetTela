import 'package:flutter/material.dart';

class Bientot extends StatelessWidget {
  const Bientot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela TV', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        elevation: 5,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: const Center(
          child: Text(
            'Bientôt disponible',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
