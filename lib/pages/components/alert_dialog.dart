import 'package:flutter/material.dart';

class MyAlertDialog {
  static Future<bool> displayAlertDialog(
      BuildContext context, String title, String message, int color) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(color),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: new Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 19,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
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
