import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mecar/util/extension/context_ext.dart';
import 'app/app/app_page.dart';
import 'app/config/app_config.dart';
import 'app/config/app_route.dart';
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

class MainApp extends StatefulWidget {
  const MainApp({Key? key})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MeCarApp(),
      localizationsDelegates:
          AppLocalizations
              .localizationsDelegates,
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'EN'),
      ],
      debugShowCheckedModeBanner: false,
      theme: context.myTheme.themeData,
      initialRoute: AppRoute.root,
      locale: AppLocalizations
          .supportedLocales.first,
      onGenerateRoute:
          (routeSettings) =>
              AppRoute.onGenerateRoute(
                  routeSettings),
    );
  }
}
