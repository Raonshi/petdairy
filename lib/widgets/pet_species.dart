import 'package:flutter/material.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/style/theme.dart';

class PetSpecies extends StatefulWidget {
  const PetSpecies({
    super.key,
    required this.onChanged,
    this.initialText = '',
  });

  final ValueChanged<AnimalType> onChanged;
  final String initialText;

  @override
  State<PetSpecies> createState() => _PetSpeciesState();
}

class _PetSpeciesState extends State<PetSpecies> {
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
        Text('종 유형', style: context.texts.labelMedium),
        TextFormField(
          controller: _textEditingController,
          readOnly: true,
          style: context.texts.bodyMedium,
          onTap: () async {
            AnimalType type = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(AnimalType.mammal),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AnimalType.mammal.string)],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(AnimalType.bird),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AnimalType.bird.string)],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(AnimalType.fish),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AnimalType.fish.string)],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(AnimalType.reptile),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AnimalType.reptile.string)],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(AnimalType.amphibians),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AnimalType.amphibians.string)],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(AnimalType.insect),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AnimalType.insect.string)],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(AnimalType.unknown),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(AnimalType.unknown.string)],
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
                    _textEditingController.text = AnimalType.unknown.string;
                    setState(() {
                      widget.onChanged(AnimalType.unknown);
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
