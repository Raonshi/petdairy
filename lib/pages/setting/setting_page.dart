import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
                  onPressed: () => context.go('/'),
                  iconSize: 32.0,
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                title: const Text('Add New Pet'),
              ),
    );
  }
}