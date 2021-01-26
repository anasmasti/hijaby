import 'package:flutter/material.dart';

class MyAlertDialog {
  static Future<bool> displayAlertDialog(BuildContext context, String title, String message, int titleColor, int messageColor) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            title,
            style: TextStyle(
              color: Color(titleColor),
              fontFamily: 'Roboto',
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: Color(messageColor),
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(true);
                // true here means you clicked ok
              },
            ),
          ],
        );
      },
    );
  }
}
