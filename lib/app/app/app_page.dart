import 'package:flutter/material.dart';
import 'package:mecar/features/sign_in/sign_in_page.dart';
import '../../base/base_state.dart';
import '../config/app_route.dart';
import 'app_cubit.dart';
import 'app_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MeCarApp extends StatefulWidget {
  const MeCarApp({Key? key})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends BaseState<AppState,
    AppCubit, MeCarApp> {
  @override
  Widget buildByState(
      BuildContext context,
      AppState state) {
    return MaterialApp(
      theme: state.appTheme.themeData,
      home: const SignInPage(),
      localizationsDelegates:
          AppLocalizations
              .localizationsDelegates,
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'EN'),
      ],
      debugShowCheckedModeBanner: false,
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
