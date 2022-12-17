import 'package:flutter/material.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/style/theme.dart';

class PetSexual extends StatefulWidget {
  const PetSexual({
    super.key,
    required this.onChanged,
    this.initialText = '',
  });

  final ValueChanged<SexType> onChanged;
  final String initialText;

  @override
  State<PetSexual> createState() => _PetSexualState();
}

class _PetSexualState extends State<PetSexual> {
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
        Text('성별', style: context.texts.labelMedium),
        TextFormField(
          controller: _textEditingController,
          readOnly: true,
          style: context.texts.bodyMedium,
          onTap: () async {
            SexType type = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(SexType.male),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(SexType.male.string),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(SexType.female),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(SexType.female.string),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(SexType.unknown),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(SexType.unknown.string),
                        ],
                      ),
                    ),
                  ],
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
                    _textEditingController.text = SexType.unknown.string;
                    setState(() {
                      widget.onChanged(SexType.unknown);
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
