import 'package:agrihub/src/app/use_cases/add_device_handler.dart';
import 'package:agrihub/src/presentation/widgets/atom/auth_text_field.dart';
import 'package:agrihub/src/presentation/widgets/atom/data_box.dart';
import 'package:agrihub/src/presentation/widgets/atom/info_box.dart';
import 'package:agrihub/src/presentation/widgets/atom/submit_button.dart';
import 'package:agrihub/src/presentation/widgets/organism/header_content.dart';
import 'package:agrihub/src/presentation/widgets/organism/header_profile.dart';
import 'package:agrihub/src/presentation/widgets/atom/modal_bottom_sheet.dart';
import 'package:agrihub/src/utils/textfield_handler.dart';
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

  final _validatorName = TextFieldHandler.validatorName;
  final _validatorID = TextFieldHandler.validatorID;

  void callBack() {
    setState(() {
      TextFieldHandler().clearTextField(
        [_controllerName, _controllerUID],
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Alat berhasil ditambahkan'),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget contentBottomSheet = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderContent(
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
        SubmitButton(
            text: 'Tambahkan',
            onTap: () => AppendDeviceHandler(_controllerName, _controllerUID)
                .addDevice(callBack)),
      ],
    );
    return SizedBox(
      width: 1.sw,
      child: Column(
        children: [
          const HeaderProfile(),
          SizedBox(height: 0.025.sh),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const HeaderContent(
                heading: 'Tambahkan Device',
                subheading: 'Tambahkan device baru',
                includeToggle: false,
              ),
              ModalBottomSheet(content: contentBottomSheet),
            ],
          ),
          SizedBox(height: 0.025.sh),
          InfoBox(
            title: 'Info',
            data: 'This is an info box',
            icon: Icons.info,
          ),
          SizedBox(height: 0.025.sh),
          DataBox(
            title: 'Kelembapan',
            data: '29.2',
            icon: Icons.water,
          ),
        ],
      ),
    );
  }
}
