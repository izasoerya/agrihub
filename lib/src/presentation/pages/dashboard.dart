import 'package:agrihub/src/app/use_cases/textfield_validator.dart';
import 'package:agrihub/src/presentation/widgets/atom/auth_text_field.dart';
import 'package:agrihub/src/presentation/widgets/atom/submit_button.dart';
import 'package:agrihub/src/presentation/widgets/organism/header_form_auth.dart';
import 'package:agrihub/src/presentation/widgets/organism/header_profile.dart';
import 'package:agrihub/src/presentation/widgets/organism/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _controllerName = TextEditingController();
  final _controllerUID = TextEditingController();

  final _validatorName = TextfieldValidator.name;
  final _validatorID = TextfieldValidator.id;

  @override
  Widget build(BuildContext context) {
    Widget contentBottomSheet = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderFormAuth(
          heading: 'Tambah Device',
          subheading: 'Tambahkan device baru untuk memantau tanaman',
          includeToggle: false,
        ),
        SizedBox(height: 0.05.sh),
        AuthTextField(
          controller: _controllerUID,
          validator: _validatorID,
          hintText: 'Kode Alat',
          label: 'Kode Alat',
        ),
        SizedBox(height: 0.03.sh),
        AuthTextField(
          controller: _controllerName,
          validator: _validatorName,
          hintText: 'Nama',
          label: 'Nama',
        ),
        SizedBox(height: 0.03.sh),
        SubmitButton(text: 'Tambahkan', onTap: () {}),
      ],
    );
    return Column(
      children: [
        const HeaderProfile(),
        ModalBottomSheet(content: contentBottomSheet),
      ],
    );
  }
}
