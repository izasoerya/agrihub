import 'package:agrihub_new/utils/enumerator.dart';
import 'package:flutter/material.dart';

class DropdownPlant extends StatefulWidget {
  final String label;
  final String? initialValue;
  final void Function(String?) onChanged;

  const DropdownPlant({
    super.key,
    required this.label,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<DropdownPlant> createState() => _DropdownPlantState();
}

class _DropdownPlantState extends State<DropdownPlant> {
  String? currentValue;
  void onChanged(String? value) {
    setState(() {
      widget.onChanged(value);
      currentValue = value;
    });
    print(currentValue);
  }

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        DropdownButton<String>(
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: PlantStrain.bayam.parseToString(),
              child: Text(PlantStrain.bayam.parseToString()),
            ),
            DropdownMenuItem<String>(
              value: PlantStrain.sawi.parseToString(),
              child: Text(PlantStrain.sawi.parseToString()),
            ),
          ],
          onChanged: onChanged,
          value: currentValue,
        ),
      ],
    );
  }
}
