import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/page/edit_pet/edit_pet_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:petdiary/tools.dart';
import 'package:petdiary/widgets/pet_birthday.dart';
import 'package:petdiary/widgets/pet_growth.dart';
import 'package:petdiary/widgets/pet_memo.dart';
import 'package:petdiary/widgets/pet_name.dart';
import 'package:petdiary/widgets/pet_sexual.dart';
import 'package:petdiary/widgets/pet_species.dart';
import 'package:provider/provider.dart';

class EditPetPage extends StatelessWidget {
  const EditPetPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ChangeNotifierProvider(
          create: (context) => EditPetProvider(id),
          builder: (context, _) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.primary,
                leading: IconButton(
                  onPressed: () => context.go('/detail?id=$id'),
                  iconSize: 32.0,
                  icon: Icon(Icons.chevron_left_rounded, color: context.colors.onPrimary),
                ),
              ),
              body: Consumer<EditPetProvider>(builder: (context, provider, _) {
                return provider.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Pet Name
                              Consumer<EditPetProvider>(
                                builder: (context, provider, _) => PetName(
                                  initialValue: provider.pet.name ?? '',
                                  onChanged: provider.onChangedName,
                                ),
                              ),
                              const SizedBox(height: 24.0),

                              // Sexual
                              Consumer<EditPetProvider>(
                                builder: (context, provider, _) => PetSexual(
                                  initialText: provider.pet.sexType?.string ?? SexType.unknown.string,
                                  onChanged: provider.onClickSexualSelect,
                                ),
                              ),
                              const SizedBox(height: 24.0),

                              // Growth
                              Consumer<EditPetProvider>(
                                builder: (context, provider, _) => PetGrowth(
                                  initialText: provider.pet.growth?.string ?? GrowthType.unknown.string,
                                  onChanged: provider.onClickGrosthSelect,
                                ),
                              ),
                              const SizedBox(height: 24.0),

                              // Species
                              Consumer<EditPetProvider>(
                                builder: (context, provider, _) => PetSpecies(
                                  initialText: provider.pet.species?.string ?? AnimalType.unknown.string,
                                  onChanged: provider.onClickSpeciesSelect,
                                ),
                              ),
                              const SizedBox(height: 24.0),

                              // BirthDay
                              Consumer<EditPetProvider>(
                                builder: (context, provider, _) => PetBirthday(
                                  initialValue:
                                      DateFormat('yyyy-MM-dd').format(provider.pet.birthDay ?? DateTime.now()),
                                  onChanged: provider.onChangedBirthday,
                                ),
                              ),
                              const SizedBox(height: 24.0),

                              // Note
                              Consumer<EditPetProvider>(
                                builder: (context, provider, child) => PetMemo(
                                  initialValue: provider.pet.note ?? '',
                                  onChanged: provider.onChangedMemo,
                                ),
                              ),
                              const SizedBox(height: 24.0),

                              Consumer<EditPetProvider>(builder: (context, provider, _) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    provider.updatePet().then(
                                      (value) {
                                        if (value) {
                                          showSnackbar(
                                            context,
                                            Row(
                                              children: [
                                                Icon(Icons.info_outline_rounded, color: context.colors.onPrimary),
                                                const SizedBox(width: 8.0),
                                                Text(
                                                  '수정이 성공했습니다.',
                                                  style: context.texts.bodyMedium!.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: context.colors.onPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                          context.go('/detail?id=$id');
                                        } else {
                                          showSnackbar(
                                            context,
                                            Row(
                                              children: [
                                                Icon(Icons.info_outline_rounded, color: context.colors.onPrimary),
                                                const SizedBox(width: 8.0),
                                                Text(
                                                  '수정이 실패했습니다.',
                                                  style: context.texts.bodyMedium!.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: context.colors.onPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 64.0),
                                    child: Text('수정'),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      );
              }),
            );
          }),
    );
  }
}
