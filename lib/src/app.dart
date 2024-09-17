import 'package:agrihub/src/app/blocs/device_state.dart';
import 'package:agrihub/src/app/blocs/firestore_stream.dart';
import 'package:agrihub/src/app/blocs/theme_state.dart';
import 'package:agrihub/src/presentation/themes/ui_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agrihub/src/app/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeStateBloc>(
            create: (context) => ThemeStateBloc(),
          ),
          BlocProvider<DeviceStateBloc>(
            create: (context) => DeviceStateBloc(),
          ),
          BlocProvider<FirestoreBloc>(
            create: (context) => FirestoreBloc(),
          ),
        ],
        child: BlocBuilder<ThemeStateBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              restorationScopeId: 'app',
              theme: UiMode.lightMode,
              darkTheme: UiMode.darkMode,
              themeMode: state.themeMode,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
