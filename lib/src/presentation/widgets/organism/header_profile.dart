import 'package:agrihub/src/presentation/widgets/atom/toggle_ui_mode.dart';
import 'package:agrihub/src/utils/account.dart';
import 'package:flutter/material.dart';
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
                radius: 25.sp,
                backgroundImage:
                    const AssetImage('assets/images/default_profile.png'),
              ),
              SizedBox(width: 0.05.sw),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userLoggedIn.displayName,
                    style: Theme.of(context).textTheme.bodyMedium,
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
