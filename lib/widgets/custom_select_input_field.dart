import 'package:flutter/material.dart';
import 'package:petdiary/style/theme.dart';

class CustomSelectInputField<T> extends StatefulWidget {
  const CustomSelectInputField({
    super.key,
    required this.onChanged,
    this.initialText = '',
    this.label,
    required this.options,
  });

  final ValueChanged<dynamic> onChanged;
  final String? label;
  final String initialText;
  final List<T> options;

  @override
  State<CustomSelectInputField> createState() => _CustomSelectInputFieldState();
}

class _CustomSelectInputFieldState extends State<CustomSelectInputField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialText);
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
          readOnly: true,
          style: context.texts.bodyMedium,
          onTap: () async {
            dynamic type = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(widget.options.length, (index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(widget.options[index]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.options[index].string),
                            ],
                          ),
                        ),
                        if (index != widget.options.length - 1) const Divider(),
                      ],
                    );
                  }),
                ),
              ),
            );

            _textEditingController.text = type.string;
            setState(() {
              widget.onChanged(type);
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
