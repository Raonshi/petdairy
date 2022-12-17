import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/page/pet_detail/pet_detail_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:provider/provider.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetDetailProvider(id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.primary,
          leading: IconButton(
            onPressed: () => context.go('/'),
            iconSize: 32.0,
            icon: Icon(Icons.chevron_left_rounded, color: context.colors.onPrimary),
          ),
          actions: [
            Consumer<PetDetailProvider>(builder: (context, provider, _) {
              return IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const SizedBox(),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '정말로 삭제하시겠습니까?',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    actionsAlignment: MainAxisAlignment.spaceAround,
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: context.colors.primary),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('아니오', style: context.texts.labelLarge!.copyWith(color: context.colors.onPrimary)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: context.colors.primary),
                        onPressed: () {
                          provider.onClickDelete().then((value) {
                            if (value) {
                              Navigator.of(context).pop();
                              context.go('/');
                            }
                          });
                        },
                        child: Text('예', style: context.texts.labelLarge!.copyWith(color: context.colors.onPrimary)),
                      ),
                    ],
                  ),
                ),
                icon: Icon(Icons.delete, color: context.colors.onPrimary),
              );
            }),
          ],
        ),
        body: SingleChildScrollView(
          child: Consumer<PetDetailProvider>(builder: (context, provider, _) {
            return Column(
              children: [
                // Banner Image
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    if (provider.pet?.image == null)
                      Container(
                        color: context.colors.secondary,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            size: 96.0,
                            color: context.colors.onSecondary,
                          ),
                        ),
                      )
                    else
                      Image.memory(Uint8List.fromList(provider.pet?.image ?? [])),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Change Image',
                            style: context.texts.bodySmall!.copyWith(
                              color: context.colors.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Download Image',
                            style: context.texts.bodySmall!.copyWith(
                              color: context.colors.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    // Name
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('이름'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(provider.pet?.name ?? ''),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.edit_rounded, size: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),

                    // Sex
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('성별'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(provider.pet?.sexType?.string ?? SexType.unknown.string),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.edit_rounded, size: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),

                    // Growth
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('성숙도'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(provider.pet?.growth?.string ?? GrowthType.unknown.string),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.edit_rounded, size: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),

                    // Species
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('종'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(provider.pet?.species?.string ?? AnimalType.unknown.string),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.edit_rounded, size: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),

                    // Birth
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('태어난 날짜'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateFormat('yyyy-MM-dd').format(provider.pet?.birthDay ?? DateTime(1970))),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.edit_rounded, size: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('메모'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(provider.pet?.note ?? ''),
                              InkWell(
                                onTap: () {},
                                child: const Icon(Icons.edit_rounded, size: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
