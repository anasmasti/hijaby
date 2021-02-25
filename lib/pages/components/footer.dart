import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijaby/pages/components/alert_dialog.dart';

class Footer extends StatefulWidget {
  Footer();

  @override
  State<StatefulWidget> createState() {
    return new FooterState();
  }
}

class FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hijaby 2021 © Copyright',
                style: TextStyle(fontSize: 12),
              ),
              FlatButton(
                  onPressed: () {
                    try{
                      Navigator.pushNamed(context, '/privacy');
                    }catch(_){
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
      ),
    );
  }
}
