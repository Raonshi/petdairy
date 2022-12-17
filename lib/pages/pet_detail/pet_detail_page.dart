import 'package:flutter/material.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Name'),
      ),
    );
  }
}
