import 'package:flutter/material.dart';
import 'package:petdiary/style/theme.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.onChanged,
    this.label,
    this.initialValue = '',
  });

  final ValueChanged<String?> onChanged;
  final String? label;
  final String initialValue;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
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
        if (widget.label != null) Text(widget.label!, style: context.texts.labelMedium),
        TextFormField(
          controller: _textEditingController,
          minLines: 10,
          maxLines: null,
          style: context.texts.bodyMedium,
          onChanged: widget.onChanged,
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
                child: const Icon(Icons.close, size: 16.0),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }
}
