import 'package:agrihub/src/domain/services/s_auth.dart';
import 'package:agrihub/src/presentation/widgets/atom/submit_button.dart';
import 'package:agrihub/src/utils/account.dart';
import 'package:agrihub/src/utils/textfield_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:agrihub/src/app/routes/routes.dart';
import 'package:agrihub/src/presentation/widgets/atom/auth_text_field.dart';
import 'package:agrihub/src/presentation/widgets/organism/header_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _validatorEmail = TextFieldHandler.email;
  final _validatorPassword = TextFieldHandler.password;

  void _onSubmit() async {
    if (_validatorEmail(_controllerEmail.text) != null ||
        _validatorPassword(_controllerPassword.text) != null) {
      return;
    }
    final response = await AuthenticationService()
        .signIn(_controllerEmail.text, _controllerPassword.text);
    if (response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email atau Password Salah'),
        ),
      );
      return;
    }
    userLoggedIn = response;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berhasil Masuk'),
      ),
    );
    router.push('/dashboard');
    setState(() {
      TextFieldHandler()
          .clearTextField([_controllerEmail, _controllerPassword]);
    });
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const HeaderContent(
            heading: 'Masuk',
            subheading: 'Masuk Untuk Melanjutkan',
          ),
          SizedBox(height: 0.03.sh),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubmitButton(text: 'Login', onTap: _onSubmit),
              TextButton(
                onPressed: () {},
                child: const Text('Lupa Password?'),
              ),
            ],
          ),
          SizedBox(height: 0.025.sh),
          TextButton(
            onPressed: () => router.push('/register'),
            child: const Text('Belum Punya Akun? Buat Akun'),
          ),
        ],
      ),
    );
  }
}
