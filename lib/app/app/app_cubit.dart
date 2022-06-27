import 'package:injectable/injectable.dart';
import '../../base/base_cubit.dart';
import 'app_state.dart';

@singleton
class AppCubit
    extends BaseCubit<AppState> {
  AppCubit() : super(const AppState());
}
