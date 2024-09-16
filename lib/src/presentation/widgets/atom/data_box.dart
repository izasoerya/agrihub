import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataBox extends StatelessWidget {
  final String title;
  final String data;
  final IconData icon;

  const DataBox({
    super.key,
    required this.title,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 10),
              Text(title,
                  style: TextStyle(
                      fontSize: ScreenUtil().orientation == Orientation.portrait
                          ? 14.sp
                          : 8.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 0.025.sh),
          Text(
            data,
            style: TextStyle(
              fontSize: ScreenUtil().orientation == Orientation.portrait
                  ? 16.sp
                  : 10.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
        ],
      ),
    );
  }
}
