import 'package:dealer/src/request-handler.enum.dart';
import 'package:flutter/material.dart';

class RequestHandlerWidget extends StatelessWidget {
  final RequestHandlerWidgetStatus status;
  final Widget Function() initialWidget;
  final Widget Function() successWidget;
  final Widget Function() errorWidget;
  final Widget Function() loadingWidget;
  final bool successAndInitialWidgetAreTheSame;
  final Text errorMessage;

  RequestHandlerWidget({
    @required this.status,
    @required this.successWidget,
    this.initialWidget,
    this.errorWidget,
    this.loadingWidget,
    this.successAndInitialWidgetAreTheSame = true,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case RequestHandlerWidgetStatus.Completed:
        return successWidget();
        break;
      case RequestHandlerWidgetStatus.Loading:
        return loadingWidget != null
            ? loadingWidget()
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
        break;
      case RequestHandlerWidgetStatus.Error:
        return errorWidget != null
            ? errorWidget()
            : Container(
                child: errorMessage != null ? errorMessage : Text('Error'),
              );
        break;
      default:
        return successAndInitialWidgetAreTheSame
            ? initialWidget != null ? initialWidget() : successWidget()
            : initialWidget != null ? initialWidget() : Container();
    }
  }
}
