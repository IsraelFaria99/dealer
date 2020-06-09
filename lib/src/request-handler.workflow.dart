import 'package:dealer/src/request-handler.enum.dart';
import 'package:flutter/foundation.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

class RequestHandlerWorkflow {
  static void handle({
    @required ReturnStatus status,
    @required Function successCallBack,
    Function errorCallBack,
    Function serverErrorCallBack,
    Function networkErrorCallBack,
    List<String> errors,
    bool usingAsuka = true,
  }) {
    switch (status) {
      case ReturnStatus.Success:
        successCallBack();
        break;
      case ReturnStatus.Error:
        if (errorCallBack != null)
          errorCallBack();
        else {
          if (usingAsuka) {
            String error = '';
            if (errors != null && errors.length > 0)
              error = errors[0];
            else
              error = 'Ocorreu um erro, tente novamente mais tarde.';
            asuka.showSnackBar(SnackBar(
              content: Text(error),
            ));
          }
        }
        break;
      case ReturnStatus.ServerError:
        if (serverErrorCallBack != null)
          serverErrorCallBack();
        else {
          if (usingAsuka) {
            asuka.showSnackBar(SnackBar(
              content: Text(
                  'Ocorreu um erro em nossos servidores, tente novamente mais tarde.'),
            ));
          }
        }
        break;
      case ReturnStatus.NetworkError:
        if (networkErrorCallBack != null)
          networkErrorCallBack();
        else {
          if (usingAsuka) {
            asuka.showSnackBar(SnackBar(
              content: Text(
                  'Sem rede, verifique sua conexão com a internet e tente novamente.'),
            ));
          }
        }
        break;
      default:
        if (usingAsuka) {
          asuka.showSnackBar(SnackBar(
            content: Text('Ocorreu um erro, tente novamente.'),
          ));
        }
    }
  }
}
