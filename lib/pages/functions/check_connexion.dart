import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hijaby/pages/components/alert_dialog.dart';

class CheckConnexion {
  static checkConnexion(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var msg;
      if (result == ConnectivityResult.none) {
        msg = MyAlertDialog.displayAlertDialog(
            context, 'No Internet Connection :/', 'You have to connect to the internet to continue to hang out on the application.', 0xffff7272, 0xFF5C5C5C);
      } 
      return msg;
    });
  }
}
