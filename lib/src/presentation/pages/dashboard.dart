import 'package:agrihub/src/presentation/widgets/organism/header_profile.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderProfile(),
      ],
    );
  }
}
