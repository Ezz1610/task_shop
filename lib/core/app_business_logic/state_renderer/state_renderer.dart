// ignore_for_file: must_be_immutable

import 'package:task/core/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../app_utils/app_assets.dart';
import '/../core/app_utils/app_text_style.dart';
import '../../app_utils/app_fonts.dart';

enum StateRendererType {
  // POPUP STATES (DIALOG)
  popupLoadingState,
  popupErrorState,
  popupSuccess,
  toastErrorState,
  toastSuccess,
  // FULL SCREEN STATED (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenSuccessState,
  fullScreenEmptyState,
  // general
  contentState,

}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;
  double? maxContentHeight;
  bool? isSliver;

  StateRenderer({Key? key, 
    required this.stateRendererType,
    this.message = "loading",
    this.title = "",
    required this.retryActionFunction,
    required this.maxContentHeight,
    this.isSliver = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widget = Container(
        constraints: BoxConstraints(
          maxHeight: maxContentHeight ?? 100.h,
        ),
        child: _getStateWidget(context));
    return isSliver!
        ? SliverToBoxAdapter(
            child: widget,
          )
        : widget;
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpLoadingDialog(context, [_getAnimatedImage(AppJsonAssets.loading)]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJsonAssets.error),
          _getMessage(message),
          getRetryButton('ok', context)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([_getAnimatedImage(AppJsonAssets.loading), _getMessage(message)]);
      case StateRendererType.fullScreenErrorState:
        return
            // EmptyViewScreen(item: EmptyItems.connectionEmpty);
            _getItemsColumn([
          _getAnimatedImage(AppJsonAssets.error),
          _getMessage(message),
          getRetryButton('retryAgain', context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([_getAnimatedImage(AppJsonAssets.empty), _getMessage(message)]);
      case StateRendererType.contentState:
        return Container();
      case StateRendererType.popupSuccess:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJsonAssets.success),
          _getMessage(title),
          _getMessage(message),
          getRetryButton('ok', context)
        ]);

      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizeManager.s14)),
      elevation: AppSizeManager.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSizeManager.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getPopUpLoadingDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        child: Lottie.asset(AppJsonAssets.loading, width: 400, height: 400),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return Lottie.asset(
      animationName,
      width: 30.h,
      height: 30.h,
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingManager.p8),
        child: Text(
          message,
          style: AppTextStyle.getRegularStyle(color: AppColors.mainColor, fontSize: FontSizeManager.s18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingManager.p18),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (stateRendererType == StateRendererType.fullScreenErrorState) {
                    // call retry function
                    retryActionFunction.call();
                  } else {
                    // popup error state
                    Navigator.of(context).pop();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }
}
