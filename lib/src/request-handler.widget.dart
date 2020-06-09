import 'package:dealer/src/request-handler.enum.dart';
import 'package:flutter/material.dart';

class RequestHandlerWidget extends StatelessWidget {
  final RequestHandlerStatus status;
  final Widget Function() initialWidget;
  final Widget Function() successWidget;
  final Widget Function() errorWidget;
  final Widget Function() loadingWidget;

  RequestHandlerWidget({
    @required this.status,
    @required this.successWidget,
    this.initialWidget,
    this.errorWidget,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case RequestHandlerStatus.Completed:
        return successWidget();
        break;
      case RequestHandlerStatus.Loading:
        return loadingWidget != null
            ? loadingWidget()
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
        break;
      case RequestHandlerStatus.Error:
        return errorWidget != null
            ? errorWidget()
            : Container(
                child: Center(
                  child: Text('Error :/'),
                ),
              );
        break;
      default:
        return initialWidget != null ? initialWidget() : Container();
    }
  }
}
