import 'package:agrihub/src/presentation/widgets/atom/toggle_ui_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderDevice extends StatefulWidget {
  final String heading;
  final String subheading;
  final bool? includeToggle;

  const HeaderDevice({
    super.key,
    required this.heading,
    required this.subheading,
    this.includeToggle = true,
  });

  @override
  _HeaderDeviceState createState() => _HeaderDeviceState();
}

class _HeaderDeviceState extends State<HeaderDevice> {
  bool isExpanded = false;

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 0.55.sw,
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _toggleExpand,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.02.sw,
                    vertical: 0.01.sh,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.heading,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize:
                                ScreenUtil().orientation == Orientation.portrait
                                    ? 12.sp
                                    : 6.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          maxLines: null, // Allow multiline text
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 0.01.sh)),
              Text(
                widget.subheading,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: ScreenUtil().orientation == Orientation.portrait
                      ? 12.sp
                      : 6.sp,
                ),
                textAlign: TextAlign.start,
                maxLines: null, // Allow multiline text
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
        widget.includeToggle! ? const ToggleUIModeButton() : const SizedBox(),
      ],
    );
  }
}
