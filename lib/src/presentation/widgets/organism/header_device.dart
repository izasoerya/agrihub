import 'package:agrihub/src/app/blocs/device_state.dart';
import 'package:agrihub/src/domain/entities/e_device.dart';
import 'package:agrihub/src/presentation/widgets/atom/toggle_ui_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderDevice extends StatefulWidget {
  final String heading;
  final String subheading;
  final List<EntitiesDevice> list;
  final bool? includeToggle;

  const HeaderDevice({
    super.key,
    required this.heading,
    required this.subheading,
    required this.list,
    this.includeToggle = true,
  });

  @override
  _HeaderDeviceState createState() => _HeaderDeviceState();
}

class _HeaderDeviceState extends State<HeaderDevice> {
  bool isExpanded = false;
  String? selectedItem;

  void _onItemSelected(String? value) {
    setState(() {
      selectedItem = value;
    });
    if (value != null) {
      // Dispatch an event to the DeviceBloc
      context.read<DeviceStateBloc>().add(ToggleDeviceEvent(
          device: widget.list
              .firstWhere((element) => element.displayName == value)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 0.55.sw,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.02.sw,
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
                    child: DropdownButton<String>(
                      value: selectedItem,
                      hint: Text(
                        widget.heading,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize:
                              ScreenUtil().orientation == Orientation.portrait
                                  ? 12.sp
                                  : 6.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: Icon(
                        isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      items: widget.list.map((EntitiesDevice item) {
                        return DropdownMenuItem<String>(
                          value: item.displayName,
                          child: Text(item.displayName),
                        );
                      }).toList(),
                      onChanged: _onItemSelected,
                      isExpanded: true,
                      underline: SizedBox(),
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
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: null, // Allow multiline text
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
            widget.includeToggle!
                ? const ToggleUIModeButton()
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
