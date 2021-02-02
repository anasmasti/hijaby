import 'package:flutter/material.dart';

boolNewToText(bool theVar) {
  String result;
  // ignore: unrelated_type_equality_checks
  if (theVar == true) {
    result = 'New';
  } else {
    result = 'Trend';
  }
  return result;
}

seasonTextToWigdet(String season, double x, double y, double fontsize, double top, double bottom) {
  if (season == 'Winter') {
    return Container(
      margin: EdgeInsets.only(bottom: bottom, top: top),
      padding: EdgeInsets.only(top: y, bottom: y, left: x, right: x),
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Winter',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
            fontSize: fontsize,
            color: Colors.white),
      ),
    );
  } else if (season == 'Spring') {
    return Container(
      margin: EdgeInsets.only(bottom: bottom, top: top),
      padding: EdgeInsets.only(top: y, bottom: y, left: x, right: x),
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Spring',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
            fontSize: fontsize,
            color: Colors.white),
      ),
    );
  } else if (season == 'Summer') {
    return Container(
      margin: EdgeInsets.only(bottom: bottom, top: top),
      padding: EdgeInsets.only(top: y, bottom: y, left: x, right: x),
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Summer',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
            fontSize: fontsize,
            color: Colors.white),
      ),
    );
  } else if (season == 'Autumn') {
    return Container(
      margin: EdgeInsets.only(bottom: bottom, top: top),
      padding: EdgeInsets.only(top: y, bottom: y, left: x, right: x),
      decoration: BoxDecoration(
        color: Colors.red[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Autumn',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Roboto',
            fontSize: fontsize,
            color: Colors.white),
      ),
    );
  }
}
