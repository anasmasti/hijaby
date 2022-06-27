import 'package:flutter/material.dart';
import 'package:hijaby/shared/components/alert_dialog.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FooterState();
  }
}

class FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Hijaby 2021 © Copyright',
              style: TextStyle(fontSize: 12),
            ),
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: () {
                  try {
                    Navigator.pushNamed(context, '/privacy');
                  } catch (_) {
                    MyAlertDialog.displayAlertDialog(
                        context,
                        'No Internet Connection :/',
                        'You have to connect to the internet to continue to hang out on the application.',
                        0xFFE57373);
                  }
                },
                child: Text(
                  'Privacy policy',
                  style: TextStyle(
                      fontSize: 12, color: Colors.deepPurple.shade400),
                )),
          ],
        ),
      ),
    );
  }
}
