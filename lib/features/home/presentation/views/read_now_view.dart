import 'package:flutter/material.dart';

class ReadNowView extends StatelessWidget {
  const ReadNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Read Now View',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
