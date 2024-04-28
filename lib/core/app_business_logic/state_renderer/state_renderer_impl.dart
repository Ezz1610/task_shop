// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../app.dart';
import 'package:flutter/material.dart';

import '../../app_utils/app_constants.dart';
import 'state_renderer.dart';

abstract class FlowState extends Equatable {
  StateRendererType getStateRendererType();
var ctx = appNavigatorKey.currentState!.context;

  String getMessage();
}
// loading state (POPUP,FULL SCREEN)

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState({required this.stateRendererType, String message = "loading"});

  @override
  String getMessage() => message ?? "loading";

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  List<Object?> get props => [stateRendererType, message];
}

// error state (POPUP,FULL SCREEN)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  List<Object?> get props => [stateRendererType, message];
}

// content state
class ContentState<T> extends FlowState {
  ContentState({this.data, this.randomInt, this.isLastPage = false});

  @override
  String getMessage() => AppConstants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;

  int? randomInt = 0;

  T? data;

  bool isLastPage;

  @override
  List<Object?> get props => [randomInt, data];
}

// EMPTY STATE

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.fullScreenEmptyState;

  @override
  List<Object?> get props => [message];
}
class PaginationSuccessState extends FlowState {
  String message;

  PaginationSuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.fullScreenEmptyState;

  @override
  List<Object?> get props => [message];
}
class PaginationLoadingState extends FlowState {
  String message;

  PaginationLoadingState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.fullScreenEmptyState;

  @override
  List<Object?> get props => [message];
}
class GetMoreProductLoadingState extends FlowState {
  String message;

  GetMoreProductLoadingState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.fullScreenEmptyState;

  @override
  List<Object?> get props => [message];
}

// success state
@immutable
class SuccessState<T> extends FlowState {
  StateRendererType stateRendererType;
  String message;
  T? data;

  SuccessState({this.data, required this.message, required this.stateRendererType});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  List<Object?> get props => [stateRendererType, message];
}

extension FlowStateExtension on FlowState {
  Widget flowStateBuilder(
    BuildContext ctx, {
    required Widget screenContent,
    required Function retry,
    Widget? loadingView,
    Widget? errorView,
    Widget? emptyView,
    Widget? successView,
    double? maxContentHeight,
    bool? isSliver = false,
  }) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.fullScreenLoadingState) {
            // full screen loading state
            return loadingView ??
                StateRenderer(
                    message: getMessage(),
                    maxContentHeight: maxContentHeight,
                    stateRendererType: getStateRendererType(),
                    retryActionFunction: retry);
          } else {
            // show content ui of the screen
            return screenContent;
          }
        }
      case ErrorState:
        {
          if (getStateRendererType() == StateRendererType.fullScreenErrorState) {
            // full screen error state
            return errorView ??
                StateRenderer(
                    maxContentHeight: maxContentHeight,
                    message: getMessage(),
                    stateRendererType: getStateRendererType(),
                    retryActionFunction: retry);
          } else {
            return screenContent;
          }
        }
      case EmptyState:
        {
          return emptyView ??
              StateRenderer(
                  maxContentHeight: maxContentHeight,
                  stateRendererType: getStateRendererType(),
                  message: getMessage(),
                  retryActionFunction: () {});
        }
      case ContentState:
        {
          return screenContent;
        }
      case SuccessState:
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          if (getStateRendererType() == StateRendererType.fullScreenLoadingState) {
            // full screen success state
            return StateRenderer(
                maxContentHeight: maxContentHeight,
                message: getMessage(),
                stateRendererType: getStateRendererType(),
                retryActionFunction: retry);
          } else {
            return screenContent;
          }
        }
      default:
        {
          return screenContent;
        }
    }
  }

  void flowStateListener(BuildContext context, {Function? retry}) {
    dismissDialog(ctx);
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // show popup loading
            showPopup(ctx, getStateRendererType(), getMessage(), dismis: false);
          }
        }
        break;
      case ErrorState:
        {
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // show popup error
            showPopup(ctx, getStateRendererType(), getMessage(), retryActionFunction: retry);
          } else if (getStateRendererType() == StateRendererType.toastErrorState) {
            // showErrorToast(ctx, getStateRendererType(), getMessage());
          }
        }
        break;
      case EmptyState:
        {}
        break;
      case ContentState:
        {}
        break;
      case SuccessState:
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          if (getStateRendererType() == StateRendererType.popupSuccess) {
            // show popup error
            showPopup(ctx, StateRendererType.popupSuccess, getMessage(), title: "success");
          } else if (getStateRendererType() == StateRendererType.toastSuccess) {
            // showSuccessToast(ctx, StateRendererType.toastSuccess, getMessage(), title: App.tr.success);
          }
        }
        break;
    }
  }

  bool _isCurrentDialogShowing(BuildContext context) => ModalRoute.of(ctx)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing2) {
      _isCurrentDialogShowing2 = false;
      Navigator.of(ctx, rootNavigator: true).pop(true);
    }
  }

  showPopup(BuildContext context, StateRendererType stateRendererType, String message,
      {String title = AppConstants.empty,
      bool dismis = true,
      double? maxContentHeight,
      Function? retryActionFunction}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _isCurrentDialogShowing2 = true;
      await showDialog(
          barrierDismissible: dismis,
          context: appNavigatorKey.currentState!.context,
          builder: (BuildContext context) => StateRenderer(
              maxContentHeight: maxContentHeight,
              stateRendererType: stateRendererType,
              message: message,
              title: title,
              retryActionFunction: retryActionFunction ?? () {}));
      _isCurrentDialogShowing2 = false;
    });
  }

  // showErrorToast(BuildContext context, StateRendererType stateRendererType, String message,
  //     {String title = AppConstants.empty}) {
  //   dismissDialog(ctx);
  //   _isCurrentDialogShowing2 = true;
  //   WidgetsBinding.instance.addPostFrameCallback((_) => AppDialogs.toastDialog(
  //       context: appNavigatorKey.currentState!.context,
  //       title: App.tr.error,
  //       content: message,
  //       boxColor: Colors.red));
  //   _isCurrentDialogShowing2 = false;
  // }
  // showSuccessToast(BuildContext context, StateRendererType stateRendererType, String message,
  //     {String title = AppConstants.empty}) {
  //   dismissDialog(ctx);
  //   _isCurrentDialogShowing2 = true;
  //   WidgetsBinding.instance.addPostFrameCallback((_) => AppDialogs.toastDialog(
  //       context: ctx,
  //       title: App.tr.success,
  //       content: message,
  //       boxColor: AppColors.mainColor));
  //   _isCurrentDialogShowing2 = false;
  // }
}

bool _isCurrentDialogShowing2 = false;
