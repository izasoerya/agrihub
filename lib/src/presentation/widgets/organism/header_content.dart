import 'package:agrihub/src/presentation/widgets/atom/toggle_ui_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderContent extends StatelessWidget {
  final String heading;
  final String subheading;
  final bool? includeToggle;
  const HeaderContent({
    super.key,
    required this.heading,
    required this.subheading,
    this.includeToggle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: ScreenUtil().orientation == Orientation.portrait
                      ? 24.sp
                      : 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
              Padding(padding: EdgeInsets.only(top: 0.01.sh)),
              Text(
                subheading,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: ScreenUtil().orientation == Orientation.portrait
                      ? 12.sp
                      : 8.sp,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        includeToggle! ? const ToggleUIModeButton() : const SizedBox(),
      ],
    );
  }
}
