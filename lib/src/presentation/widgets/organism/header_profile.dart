import 'package:agrihub/src/presentation/widgets/atom/toggle_ui_mode.dart';
import 'package:agrihub/src/utils/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: ScreenUtil().orientation == Orientation.portrait
                    ? 25.sp
                    : 15.sp,
                backgroundImage:
                    const AssetImage('assets/images/default_profile.png'),
              ),
              SizedBox(width: 0.05.sw),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: ScreenUtil().orientation == Orientation.portrait
                          ? 16.sp
                          : 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userLoggedIn.displayName,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      fontSize: ScreenUtil().orientation == Orientation.portrait
                          ? 14.sp
                          : 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
          const ToggleUIModeButton(),
        ],
      ),
    );
  }
}
