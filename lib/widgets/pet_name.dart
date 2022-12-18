import 'package:flutter/material.dart';
import 'package:petdiary/style/theme.dart';

class PetName extends StatefulWidget {
  const PetName({super.key, required this.onChanged, this.initialValue = ''});

  final ValueChanged<String?> onChanged;
  final String initialValue;

  @override
  State<PetName> createState() => _PetNameState();
}

class _PetNameState extends State<PetName> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('이름', style: context.texts.labelMedium),
        TextFormField(
          controller: _textEditingController,
          onChanged: widget.onChanged,
          style: context.texts.bodyMedium,
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            border: const OutlineInputBorder(),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                  onTap: () {
                    _textEditingController.clear();
                    widget.onChanged(null);
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
