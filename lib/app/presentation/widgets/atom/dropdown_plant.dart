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
      padding: EdgeInsets.symmetric(vertical: 0.001.sh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: DropdownButton<String>(
        hint: RichText(
          text: TextSpan(
            text: widget.label,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
            children: [
              TextSpan(
                text: ' (*)',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        underline: Container(),
        dropdownColor: Theme.of(context).colorScheme.secondary,
        padding: EdgeInsets.symmetric(horizontal: 0.025.sw),
        items: <DropdownMenuItem<String>>[
          for (var item in PlantStrain.values)
            DropdownMenuItem<String>(
              value: item.parseToString(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 0.4.sw),
                  child: Text(
                    item.parseToString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            )
        ],
        onChanged: onChanged,
        value: currentValue,
      ),
    );
  }
}
