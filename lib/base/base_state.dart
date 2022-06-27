import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app/app/app_error.dart';
import '../app/app/app_msg.dart';
import '../di/injector.dart';
import '../util/log_util.dart';
import '../widget_common/dialog_widget.dart';
import '../widget_common/loading_widget.dart';
import 'base_cubit.dart';
import 'base_event.dart';

abstract class BaseState<
        S,
        C extends BaseCubit<S>,
        W extends StatefulWidget>
    extends State<W>
    with AutomaticKeepAliveClientMixin {
  final C cubit = getIt<C>();
  final loadingController =
      MeCarLoadingController();
  late S _state;
  StreamSubscription? _eventStreamSub;

  S get state => _state;

  @override
  void initState() {
    super.initState();
    _state = cubit.state;
    _eventStreamSub =
        cubit.eventStream.listen(
      (value) => onNewEvent(value),
    );
    LogUtil.createCubitAndState(C, S);
  }

  @override
  void dispose() {
    _eventStreamSub?.cancel();
    cubit.close();
    LogUtil.deleteCubitAndState(C, S);
    super.dispose();
  }

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
        value: cubit,
        child: BlocListener<C, S>(
          listenWhen:
              (S previous, S current) {
            onStateChanged(
                previous, current);
            return shouldRebuild(
                previous, current);
          },
          listener: (context, state) =>
              setState(
                  () => _state = state),
          child: MeCarLoadingHUD(
              controller:
                  loadingController,
              child: buildByState(
                  context, _state)),
        ));
  }

  Widget buildByState(
      BuildContext context, S state);

  onStateChanged(
      S previous, S current) {}

  bool shouldRebuild(
      S previous, S current) {
    return true;
  }

  Widget buildLoadingWidget(
      BuildContext context) {
    return Container();
  }

  onNewEvent(BaseEvent event) {
    if (event is LoadingEvent) {
      event.isLoading
          ? loadingController
              .showLoading(
                  blurBG: event
                      .hasBlurBackground,
                  msg: getMessage(
                      event.message))
          : loadingController
              .hideLoading();
    }
    if (event is MessageEvent) {
      showMessage(
          getMessage(event.msg));
    }
    if (event is ErrorEvent) {
      showError(
          getErrorMessage(event.error));
    }
  }

  Future<void> showMessage(
      String message) {
    return showDialog(
      context: context,
      builder: (context) {
        return MeCarDialog(
            message: message);
      },
    );
  }

  void showOptionalDialog({
    required String message,
    required VoidCallback
        onPressedAltBtn,
    required VoidCallback onPressedBtn,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return MeCarOptionalDialog(
            message: message,
            onPressedAltBtn:
                onPressedAltBtn,
            onPressedBtn: onPressedBtn);
      },
    );
  }

  showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return MeCarDialog(
            message: message);
      },
    );
  }

  String getErrorMessage(error) {
    if (error is AppError) {
      return error.localized(context);
    }
    return AppError.unKnown
        .localized(context);
  }

  String getMessage(msg) {
    if (msg is AppMsg) {
      return msg.localized(context);
    }
    return '';
  }
}
