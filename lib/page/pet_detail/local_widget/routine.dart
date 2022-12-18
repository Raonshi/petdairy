import 'package:flutter/material.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/data/routine_model.dart';
import 'package:petdiary/page/pet_detail/pet_detail_provider.dart';
import 'package:petdiary/style/theme.dart';
import 'package:petdiary/tools.dart';

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
                final Routine routine = routines[index];
                return _RoutineCard(
                  routine: routine,
                  backgroundColor: context.colors.secondary,
                  onClickEdit: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('${routine.dayOfWeek}요일 루틴 수정'),
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
    lgr.d(_enableNoti);
    lgr.d(widget.initialValue);
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
    this.backgroundColor = Colors.grey,
  });

  final Routine routine;
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
                  widget.routine.dayOfWeek ?? '',
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
