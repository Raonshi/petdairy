import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/page/pet_detail/local_widget/routine.dart';
import 'package:petdiary/page/pet_detail/pet_detail_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:petdiary/tools.dart';
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
        body: Consumer<PetDetailProvider>(builder: (context, provider, _) {
          if (provider.pet == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return SingleChildScrollView(
            child: Column(
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
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                provider
                                                    .onClickImageFromGallery()
                                                    .then((value) => Navigator.of(context).pop());
                                              },
                                              child: Column(
                                                children: const [
                                                  Icon(Icons.image, size: 64.0),
                                                  Text(
                                                    'Get photo from gallery',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                provider
                                                    .onClickImageFromCamera()
                                                    .then((value) => Navigator.of(context).pop());
                                              },
                                              child: Column(
                                                children: const [
                                                  Icon(Icons.camera, size: 64.0),
                                                  Text(
                                                    'Get photo from camera',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ).then((value) {
                                lgr.d('asdfasdf');
                                provider.updatePet();
                              });
                            },
                            child: Text(
                              'Change',
                              style: context.texts.bodyLarge!.copyWith(
                                color: context.colors.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => provider.downloadImage().then((value) {
                              if (value) {
                                showSnackbar(
                                  context,
                                  Row(
                                    children: [
                                      Icon(Icons.info_outline_rounded, color: context.colors.onPrimary),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '사진을 성공적으로 다운로드했습니다.',
                                        style: context.texts.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: context.colors.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                showSnackbar(
                                  context,
                                  Row(
                                    children: [
                                      Icon(Icons.info_outline_rounded, color: context.colors.onPrimary),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        '사진 다운로드를 실패했습니다.',
                                        style: context.texts.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: context.colors.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                            child: Text(
                              'Download',
                              style: context.texts.bodyLarge!.copyWith(
                                color: context.colors.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // Name
                                  Text(
                                    provider.pet?.name ?? '',
                                    style: context.texts.headlineSmall,
                                  ),
                                  const SizedBox(width: 8.0),

                                  // Sex
                                  if ((provider.pet?.sexType ?? SexType.unknown) == SexType.male)
                                    Icon(Icons.male_rounded, size: 28.0, color: Colors.lightBlue.shade300)
                                  else if ((provider.pet?.sexType ?? SexType.unknown) == SexType.female)
                                    Icon(Icons.female_rounded, size: 28.0, color: Colors.red.shade300)
                                  else
                                    Icon(Icons.question_mark, size: 28.0, color: context.theme.disabledColor),
                                ],
                              ),

                              // Edit
                              Consumer<PetDetailProvider>(builder: (context, provider, _) {
                                return InkWell(
                                  onTap: () => context.go('/edit?id=${provider.pet?.uid}'),
                                  child: Icon(Icons.edit_rounded, size: 24.0, color: context.colors.secondary),
                                );
                              }),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // Species
                                  Text(
                                    provider.pet?.species?.string ?? AnimalType.unknown.string,
                                    style: context.texts.bodyLarge,
                                  ),
                                  const SizedBox(width: 8.0),

                                  // Growth
                                  Text(
                                    provider.pet?.growth?.string ?? GrowthType.unknown.string,
                                    style: context.texts.bodyLarge,
                                  ),
                                ],
                              ),

                              // Birthday
                              Text(
                                DateFormat('yyyy-MM-dd').format(provider.pet?.birthDay ?? DateTime(1970)),
                                style: context.texts.bodyLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),

                          // Memo
                          Text(
                            provider.pet?.note ?? '',
                            style: context.texts.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    PetRootine(
                      routines: provider.pet?.routines ?? [],
                      provider: provider,
                    ),
                    const Divider(),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
