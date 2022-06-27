import 'package:flutter/material.dart';
import 'package:mecar/features/sign_in/sign_in_page.dart';
import '../../base/base_state.dart';
import 'app_cubit.dart';
import 'app_state.dart';

class MeCarApp extends StatefulWidget {
  const MeCarApp({Key? key})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends BaseState<AppState,
    AppCubit, MeCarApp> {
  _State() : super();

  @override
  Widget buildByState(
      BuildContext context,
      AppState state) {
    return const SignInPage();
  }
}
