import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/page/root/root_provider.dart';
import 'package:petdiary/style/theme.dart';
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
            backgroundColor: context.colors.primary,
            title: Text(
              'Pet Diary',
              style: context.texts.titleLarge!.copyWith(color: context.colors.onPrimary),
            ),
            actions: [
              IconButton(
                onPressed: () => context.go('/setting'),
                icon: Icon(Icons.settings, color: context.colors.onPrimary),
              ),
            ],
          ),
          body: Consumer<RootProvider>(builder: (context, provider, _) {
            if (provider.pets.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline_rounded, size: 64.0, color: context.theme.disabledColor),
                    Text(
                      '동물 정보가 등록되지 않았습니다.',
                      style: context.texts.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.disabledColor,
                      ),
                    ),
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
                  onTap: () => context.go('/detail?id=${pet.uid}'),
                  leading: pet.image == null
                      ? Container(
                          decoration: BoxDecoration(
                            color: context.colors.secondary,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          width: 50.0,
                          height: 50.0,
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported_rounded,
                              color: context.colors.onSecondary,
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.memory(
                            Uint8List.fromList(pet.image ?? []),
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                  title: Text(pet.name ?? '', style: context.texts.bodyLarge),
                  subtitle: Text(pet.species?.string ?? '', style: context.texts.bodySmall),
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
