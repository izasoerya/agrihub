import 'package:agrihub_new/utils/enumerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.005.sh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: DropdownButton<String>(
        hint: Text("Jenis",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            )),
        underline: Container(),
        dropdownColor: Theme.of(context).colorScheme.secondary,
        padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
        items: <DropdownMenuItem<String>>[
          for (var item in PlantStrain.values)
            DropdownMenuItem<String>(
              value: item.parseToString(),
              child: Text(item.parseToString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  )),
            )
        ],
        onChanged: onChanged,
        value: currentValue,
      ),
    );
  }
}
