import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petdiary/data/pet_model.dart';
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
            actions: [
              IconButton(
                onPressed: () => context.go('/setting'),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: Consumer<RootProvider>(builder: (context, provider, _) {
            if (provider.pets.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.error_outline_rounded, size: 64.0),
                    Text('동물 정보가 등록되지 않았습니다.'),
                  ],
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: provider.pets.length,
              itemBuilder: (context, index) {
                final Pet pet = provider.pets[index];
                return ListTile(
                  onTap: () => context.go('/detail?id=test0'),
                  leading: Container(
                    color: Colors.grey,
                    width: 50.0,
                    height: 50.0,
                    child: const Center(
                      child: Text('Pet Image'),
                    ),
                  ),
                  title: Text(pet.name ?? ''),
                  subtitle: Text(pet.species?.string ?? ''),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.go('/add'),
            child: const Icon(Icons.add_rounded, size: 32.0),
          ),
        );
      },
    );
  }
}
