import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petdiary/pages/root/root_provider.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootProvider(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pet Diary'),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: 30,
            itemBuilder: (context, index) => ListTile(
              onTap: () => context.go('/detail?id=test0'),
              leading: Container(
                color: Colors.grey,
                width: 50.0,
                height: 50.0,
                child: const Center(
                  child: Text('Pet Image'),
                ),
              ),
              title: const Text('Pet Name'),
              subtitle: const Text('Pet species'),
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_rounded, size: 32.0),
          ),
        );
      },
    );
  }
}
