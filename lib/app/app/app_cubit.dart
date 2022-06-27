import 'package:injectable/injectable.dart';
import 'package:mecar/app/theme/themes.dart';
import 'package:rxdart/subjects.dart';
import '../../base/base_cubit.dart';
import 'app_state.dart';

@singleton
class AppCubit
    extends BaseCubit<AppState> {
  AppCubit()
      : super(AppState(
            appTheme:
                MeCarThemeData.dark()));

  final appThemeSubject =
      PublishSubject<MeCarThemeData>();
  Stream<MeCarThemeData>
      get appThemeStream =>
          appThemeSubject.stream;

  changeTheme(MeCarThemeData appTheme) {
    emit(state.copyWith(
        appTheme: appTheme));
    appThemeSubject.add(appTheme);
  }

  @override
  Future<void> close() {
    appThemeSubject.close();
    return super.close();
  }
}
