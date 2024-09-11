import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import 'package:agrihub/src/app/routes/routes.dart';
import 'package:agrihub/src/domain/entities/e_auth.dart';
import 'package:agrihub/src/domain/services/s_auth.dart';
import 'package:agrihub/src/app/use_cases/textfield_validator.dart';
import 'package:agrihub/src/presentation/widgets/atom/submit_button.dart';
import 'package:agrihub/src/presentation/widgets/atom/auth_text_field.dart';
import 'package:agrihub/src/presentation/widgets/organism/header_form_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _uuid = const Uuid();
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _validatorName = TextfieldValidator.name;
  final _validatorEmail = TextfieldValidator.email;
  final _validatorPassword = TextfieldValidator.password;

  void _setUser() {
    final user = EntitiesAuth(
      uid: _uuid.v4(),
      displayName: _controllerName.text,
      email: _controllerEmail.text,
      password: _controllerPassword.text,
    );
    _onSubmit(user);
  }

  void _onSubmit(EntitiesAuth user) async {
    if (_validatorEmail(_controllerEmail.text) != null ||
        _validatorPassword(_controllerPassword.text) != null ||
        _validatorName(_controllerName.text) != null) {
      return;
    }
    final response = await AuthenticationService().signUp(user);
    if (response == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal membuat akun'),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Akun berhasil dibuat'),
      ),
    );
    router.go('/login');
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1.sw,
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().orientation == Orientation.portrait
              ? 0.05.sw
              : 0.25.sw,
          vertical: 0.05.sh,
        ),
        padding: EdgeInsets.symmetric(vertical: 0.03.sh, horizontal: 0.05.sw),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderFormAuth(
              heading: 'Buat Akun',
              subheading: 'Buat Akun Untuk Melanjutkan',
            ),
            SizedBox(height: 0.03.sh),
            AuthTextField(
              controller: _controllerName,
              validator: _validatorName,
              hintText: 'Nama',
              label: 'Nama',
            ),
            SizedBox(height: 0.02.sh),
            AuthTextField(
              controller: _controllerEmail,
              validator: _validatorEmail,
              hintText: 'Email',
              label: 'Email',
            ),
            SizedBox(height: 0.02.sh),
            AuthTextField(
              controller: _controllerPassword,
              validator: _validatorPassword,
              hintText: 'Password',
              label: 'Password',
            ),
            SizedBox(height: 0.02.sh),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: SubmitButton(text: 'Simpan', onTap: _setUser),
            ),
            SizedBox(height: 0.025.sh),
            TextButton(
              onPressed: () => router.go('/login'),
              child: const Text('Sudah Punya Akun?'),
            ),
          ],
        ),
      ),
    );
  }
}
