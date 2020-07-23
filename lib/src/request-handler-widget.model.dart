import 'package:dealer/src/request-handler.enum.dart';

class RequestHandlerWidgetModel {
  RequestHandlerWidgetStatus status;
  RequestHandlerWidgetModel(
      {this.status = RequestHandlerWidgetStatus.Initial});

  void setInitial() {
    this.status = RequestHandlerWidgetStatus.Initial;
  }

  void setLoading() {
    this.status = RequestHandlerWidgetStatus.Loading;
  }

  void setCompleted() {
    this.status = RequestHandlerWidgetStatus.Completed;
  }

  void setError() {
    this.status = RequestHandlerWidgetStatus.Error;
  }
}
