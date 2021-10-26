import 'package:flutter/material.dart';

class MyAlertDialog {
  static Future displayAlertDialog(
      BuildContext context, String title, String message, int color) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(color),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 19,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: const Text(
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
