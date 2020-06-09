import 'package:dealer/src/request-handler.enum.dart';

class HandlerResult {
  List<String> errors;
  ReturnStatus status;
  Map<String, dynamic> data;

  HandlerResult({this.errors, this.status, this.data});
}
