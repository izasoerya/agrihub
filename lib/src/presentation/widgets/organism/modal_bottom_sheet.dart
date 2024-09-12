import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalBottomSheet extends StatefulWidget {
  final Widget content;
  const ModalBottomSheet({super.key, required this.content});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showMaterialModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            height: 0.7.sh,
            margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
            padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sh),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(child: widget.content),
          ),
        );
      },
      icon: const Icon(Icons.add_circle_rounded),
    );
  }
}
