import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/page/add_pet/add_pet_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:petdiary/widgets/pet_birthday.dart';
import 'package:petdiary/widgets/pet_growth.dart';
import 'package:petdiary/widgets/pet_memo.dart';
import 'package:petdiary/widgets/pet_name.dart';
import 'package:petdiary/widgets/pet_sexual.dart';
import 'package:petdiary/widgets/pet_species.dart';
import 'package:provider/provider.dart';

class AddPetPage extends StatelessWidget {
  const AddPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ChangeNotifierProvider(
          create: (context) => AddPetProvider(),
          builder: (context, _) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.primary,
                leading: IconButton(
                  onPressed: () => context.go('/'),
                  iconSize: 32.0,
                  icon: Icon(Icons.chevron_left_rounded, color: context.colors.onPrimary),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Consumer<AddPetProvider>(builder: (context, provider, _) {
                        return InkWell(
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
                                              provider.onClickImageFromGallery();
                                              Navigator.of(context).pop();
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
                                              provider.onClickImageFromCamera();
                                              Navigator.of(context).pop();
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
                            );
                          },
                          child: provider.cachedImage == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: context.colors.secondary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image_rounded, size: 96.0, color: context.colors.onSecondary),
                                      Text(
                                        'Upload image',
                                        style: context.texts.bodyLarge!.copyWith(
                                          color: context.colors.onSecondary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.memory(
                                    Uint8List.fromList(provider.cachedImage ?? []),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width,
                                    gaplessPlayback: true,
                                  ),
                                ),
                        );
                      }),
                      const SizedBox(height: 24.0),

                      // Pet Name
                      Consumer<AddPetProvider>(
                        builder: (context, provider, _) => PetName(onChanged: provider.onChangedName),
                      ),
                      const SizedBox(height: 24.0),

                      // Sexual
                      Consumer<AddPetProvider>(
                        builder: (context, provider, _) => PetSexual(
                          initialText: provider.newPet.sexType?.string ?? SexType.unknown.string,
                          onChanged: provider.onClickSexualSelect,
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      // Growth
                      Consumer<AddPetProvider>(
                        builder: (context, provider, _) => PetGrowth(
                          initialText: provider.newPet.growth?.string ?? GrowthType.unknown.string,
                          onChanged: provider.onClickGrosthSelect,
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      // Species
                      Consumer<AddPetProvider>(
                        builder: (context, provider, _) => PetSpecies(
                          initialText: provider.newPet.species?.string ?? AnimalType.unknown.string,
                          onChanged: provider.onClickSpeciesSelect,
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      // BirthDay
                      Consumer<AddPetProvider>(
                        builder: (context, provider, _) => PetBirthday(onChanged: provider.onChangedBirthday),
                      ),
                      const SizedBox(height: 24.0),

                      // Note
                      Consumer<AddPetProvider>(
                        builder: (context, provider, child) => PetMemo(onChanged: provider.onChangedMemo),
                      ),
                      const SizedBox(height: 24.0),

                      Consumer<AddPetProvider>(builder: (context, provider, _) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            provider.createPet().then((value) {
                              if (value) {
                                context.go('/');
                              }
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 64.0),
                            child: Text('추가'),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
