import 'package:flutter/material.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/style/theme.dart';

class PetGrowth extends StatefulWidget {
  const PetGrowth({
    super.key,
    required this.onChanged,
    this.initialText = '',
  });

  final ValueChanged<GrowthType> onChanged;
  final String initialText;

  @override
  State<PetGrowth> createState() => _PetGrowthState();
}

class _PetGrowthState extends State<PetGrowth> {
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
        Text('성숙도', style: context.texts.labelMedium),
        TextFormField(
          controller: _textEditingController,
          readOnly: true,
          style: context.texts.bodyMedium,
          onTap: () async {
            GrowthType type = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(GrowthType.baby),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(GrowthType.baby.string),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(GrowthType.juvenile),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(GrowthType.juvenile.string),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(GrowthType.adult),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(GrowthType.adult.string),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(GrowthType.unknown),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(GrowthType.unknown.string),
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
                    _textEditingController.text = GrowthType.unknown.string;
                    setState(() {
                      widget.onChanged(GrowthType.unknown);
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
