import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mecar/app/app/app_cubit.dart';
import 'package:mecar/app/config/app_route.dart';
import 'package:mecar/app/theme/themes.dart';
import 'app/app/app_page.dart';
import 'app/config/app_config.dart';
import 'di/injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runAppWithConfig(AppConfig.prod());
}

runAppWithConfig(AppConfig appConfig) {
  runZonedGuarded<Future<void>>(
      () async {
    WidgetsFlutterBinding
        .ensureInitialized();

    //GETIT
    configureDependencies(appConfig);

    runApp(const MainApp());
  }, (error, stack) => print(error));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = getIt<AppCubit>();
    return StreamBuilder<
            MeCarThemeData>(
        stream: appCubit.appThemeStream,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: appCubit.state
                .appTheme.themeData,
            home: const MeCarApp(),
            localizationsDelegates:
                AppLocalizations
                    .localizationsDelegates,
            supportedLocales: const [
              Locale('vi', 'VN'),
              Locale('en', 'EN'),
            ],
            debugShowCheckedModeBanner:
                false,
            initialRoute: AppRoute.root,
            locale: AppLocalizations
                .supportedLocales.first,
            onGenerateRoute:
                (routeSettings) => AppRoute
                    .onGenerateRoute(
                        routeSettings),
          );
        });
  }
}
