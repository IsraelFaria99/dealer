import 'package:dealer/src/request-handler.enum.dart';

class RequestHandlerWorkflowResult {
  List<String> errors;
  RequestHandlerWorkflowStatus status;
  Map<String, dynamic> data;

  RequestHandlerWorkflowResult({this.errors, this.status, this.data});
}
