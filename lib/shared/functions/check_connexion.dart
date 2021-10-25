import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hijaby/shared/components/alert_dialog.dart';

class CheckConnexion {
  static checkConnexion(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // ignore: prefer_typing_uninitialized_variables
      var msg;
      if (result == ConnectivityResult.none) {
        msg = MyAlertDialog.displayAlertDialog(
            context,
            'No Internet Connection :/',
            'You have to connect to the internet to continue to hang out on the application.',
            0xFFE57373);
      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        msg = MyAlertDialog.displayAlertDialog(context, 'Welcome To Hijaby',
            'Enjoy with the new hijab collection you desire.', 0xFFce93d8);
      }
      // ignore: void_checks
      return msg;
    });
  }
}
