import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petdiary/style/theme.dart';

class PetRootine extends StatefulWidget {
  const PetRootine({super.key, required this.onChangedNoti});

  final ValueChanged<bool> onChangedNoti;

  @override
  State<PetRootine> createState() => _PetRootineState();
}

class _PetRootineState extends State<PetRootine> {
  final List<String> week = ['월', '화', '수', '목', '금', '토', '일'];
  late bool _enableNoti;

  @override
  void initState() {
    _enableNoti = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '루틴',
                style: context.texts.headlineSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    _enableNoti ? Icons.notifications_active : Icons.notifications_off,
                    color: _enableNoti ? context.colors.primary : context.theme.disabledColor,
                  ),
                  Switch.adaptive(
                      activeColor: context.colors.secondary,
                      value: _enableNoti,
                      onChanged: (value) {
                        setState(() => _enableNoti = !_enableNoti);
                        widget.onChangedNoti(_enableNoti);
                      }),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(week.length, (index) {
                final String day = week[index];
                return _RoutineCard(
                  day: day,
                  backgroundColor: context.colors.secondary,
                  onClickEdit: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('$day요일 루틴 수정'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('루틴 종류 선택'),
                            Text('루틴 상세 내용'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class _RoutineCard extends StatefulWidget {
  const _RoutineCard({
    required this.day,
    required this.onClickEdit,
    this.backgroundColor = Colors.grey,
  });

  final String day;
  final Color backgroundColor;
  final VoidCallback onClickEdit;

  @override
  State<_RoutineCard> createState() => __RoutineCardState();
}

class __RoutineCardState extends State<_RoutineCard> {
  bool isEnable = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isEnable = !isEnable;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: isEnable
                  ? LinearGradient(
                      colors: [
                        widget.backgroundColor.withOpacity(0.7),
                        widget.backgroundColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [
                        context.theme.disabledColor.withOpacity(0.7),
                        context.theme.disabledColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
            ),
            child: Column(
              children: [
                Text(
                  widget.day,
                  style: context.texts.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isEnable ? context.colors.onSecondary : context.colors.onBackground,
                  ),
                ),
                Divider(color: context.colors.onSecondary, thickness: 1.0, height: 1.0),
                Text(
                  '먹이',
                  style: context.texts.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isEnable ? context.colors.onSecondary : context.colors.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: widget.onClickEdit,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              '수정',
              style: context.texts.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colors.tertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
