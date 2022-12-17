import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petdiary/style/theme.dart';

class PetBirthday extends StatefulWidget {
  const PetBirthday({super.key, required this.onChanged});

  final ValueChanged<DateTime?> onChanged;

  @override
  State<PetBirthday> createState() => _PetBirthdayState();
}

class _PetBirthdayState extends State<PetBirthday> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('태어난 날짜', style: context.texts.labelMedium),
        TextFormField(
          controller: _textEditingController,
          readOnly: true,
          style: context.texts.bodyMedium,
          onTap: () async {
            DateTime date = await showDialog(
              context: context,
              builder: (context) => DatePickerDialog(
                initialDate: DateTime.now(),
                firstDate: DateTime(1970, 1, 1),
                lastDate: DateTime(2099, 12, 31),
              ),
            );

            _textEditingController.text = DateFormat('yyyy-MM-dd').format(date);
            setState(() {
              widget.onChanged(date);
            });
          },
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            border: const OutlineInputBorder(),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                  onTap: () {
                    _textEditingController.clear();
                    setState(() {
                      widget.onChanged(null);
                    });
                  },
                  child: const Icon(Icons.close, size: 16.0)),
            ),
            suffixIconConstraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }
}
