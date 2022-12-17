import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/pages/pet_detail/pet_detail_provider.dart';
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
          leading: IconButton(
            onPressed: () => context.go('/'),
            iconSize: 32.0,
            icon: const Icon(Icons.chevron_left_rounded),
          ),
          title: Consumer<PetDetailProvider>(builder: (context, provider, _) {
            return Text(provider.pet?.name ?? '');
          }),
        ),
        body: Consumer<PetDetailProvider>(builder: (context, provider, _) {
          return Column(
            children: [
              // Banner Image
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: const Center(
                      child: Text('Pet Image'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Change Image'),
                        Text('Download Image'),
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
    );
  }
}
