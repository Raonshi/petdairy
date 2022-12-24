import 'package:flutter/material.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/data/routine_model.dart';
import 'package:petdiary/page/pet_detail/pet_detail_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:petdiary/tools.dart';
import 'package:petdiary/widgets/custom_input_field.dart';
import 'package:petdiary/widgets/custom_select_input_field.dart';

class PetRootine extends StatelessWidget {
  const PetRootine({super.key, required this.routines, required this.provider});

  final PetDetailProvider provider;
  final List<Routine> routines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _RoutineHeader(
          initialValue: provider.pet?.isNotiEnabled ?? false,
          onChangedNoti: (value) {
            provider.changeNotiStatus(value);
            if (value) {
              showSnackbar(
                context,
                Row(
                  children: [
                    Icon(Icons.info_outline_rounded, color: context.colors.onPrimary),
                    const SizedBox(width: 8.0),
                    Text(
                      '루틴 알림을 설정했습니다.',
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
                      '루틴 알림을 취소했습니다.',
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
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(routines.length, (index) {
                Routine routine = routines[index];
                return _RoutineCard(
                  routine: routine,
                  backgroundColor: context.colors.secondary,
                  onClickCard: (value) {
                    routine = routine.copyWith(isEnable: value);
                    provider.updateRoutine(routine, index);
                  },
                  onClickEdit: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        Routine newRoutine = routine.copyWith();
                        return AlertDialog(
                          title: Text('${routine.dayOfWeek}요일 루틴 수정'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomSelectInputField<RoutineType>(
                                initialText: routine.type.string,
                                options: RoutineType.values,
                                onChanged: (value) {
                                  newRoutine = newRoutine.copyWith(type: value);
                                  lgr.d(routine);
                                },
                              ),
                              const SizedBox(height: 8.0),
                              CustomInputField(
                                label: '루틴 내용',
                                initialValue: routine.detail ?? '',
                                onChanged: (value) {
                                  newRoutine = newRoutine.copyWith(detail: value);
                                },
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                routine = routine.copyWith(type: newRoutine.type, detail: newRoutine.detail);
                                Navigator.of(context).pop();
                              },
                              child: const Text('저장'),
                            ),
                          ],
                        );
                      },
                    );

                    provider.updateRoutine(routine, index);
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

class _RoutineHeader extends StatefulWidget {
  const _RoutineHeader({required this.onChangedNoti, this.initialValue = false});

  final ValueChanged<bool> onChangedNoti;
  final bool initialValue;

  @override
  State<_RoutineHeader> createState() => __RoutineHeaderState();
}

class __RoutineHeaderState extends State<_RoutineHeader> {
  late bool _enableNoti;

  @override
  void initState() {
    _enableNoti = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class _RoutineCard extends StatefulWidget {
  const _RoutineCard({
    required this.routine,
    required this.onClickEdit,
    required this.onClickCard,
    this.backgroundColor = Colors.grey,
  });

  final Routine routine;
  final Color backgroundColor;
  final VoidCallback onClickEdit;
  final ValueChanged<bool> onClickCard;

  @override
  State<_RoutineCard> createState() => __RoutineCardState();
}

class __RoutineCardState extends State<_RoutineCard> {
  late bool isEnable;

  @override
  void initState() {
    isEnable = widget.routine.isEnable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isEnable = !isEnable;
            });
            widget.onClickCard(isEnable);
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
                  widget.routine.dayOfWeek,
                  style: context.texts.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isEnable ? context.colors.onSecondary : context.colors.onBackground,
                  ),
                ),
                Divider(color: context.colors.onSecondary, thickness: 1.0, height: 1.0),
                Text(
                  widget.routine.type.string,
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
