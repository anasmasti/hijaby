import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hijaby/shared/components/alert_dialog.dart';
import 'package:http/http.dart' as http;

class FetchData {
  final url = 'https://hijaby.herokuapp.com/api';

  Future getPosts(BuildContext context) async {
    var posts = [];
    try {
      http.Response response = await http.get(Uri.parse('$url/posts'));
      if (response.statusCode == 200) {
        var myposts = json.decode(response.body.toString());
        for (var mypost in myposts) {
          posts.add(mypost);
        }
      }
      return posts;
    } catch (_) {
      return MyAlertDialog.displayAlertDialog(
          context,
          'No Internet Connection :/',
          'You have to connect to the internet to continue to hang out on the application.',
          0xFFE57373);
    }
  }

  Future getSeasons(BuildContext context) async {
    var seasons = [];
    try {
      http.Response response = await http.get(Uri.parse('$url/seasons'));
      if (response.statusCode == 200) {
        var myseasons = json.decode(response.body.toString());
        for (var myseason in myseasons) {
          seasons.add(myseason);
        }
      }
      return seasons;
    } catch (_) {
      return MyAlertDialog.displayAlertDialog(
          context,
          'No Internet Connection :/',
          'You have to connect to the internet to continue to hang out on the application.',
          0xFFE57373);
    }
  }

  Future getPostsBySeasons(BuildContext context, String idSeason) async {
    var seasons = [];
    try {
      http.Response response =
          await http.get(Uri.parse('$url/posts/byseason/$idSeason'));
      if (response.statusCode == 200) {
        var myseasons = json.decode(response.body.toString());
        for (var myseason in myseasons) {
          seasons.add(myseason);
        }
      }
      return seasons;
    } catch (_) {
      return MyAlertDialog.displayAlertDialog(
          context,
          'No Internet Connection :/',
          'You have to connect to the internet to continue to hang out on the application.',
          0xFFE57373);
    }
  }

  Future getNewPosts(BuildContext context) async {
    var posts = [];
    try {
      http.Response response = await http.get(Uri.parse('$url/posts/new/post'));
      if (response.statusCode == 200) {
        var myposts = json.decode(response.body.toString());
        for (var mypost in myposts) {
          posts.add(mypost);
        }
      }
      return posts;
    } catch (_) {
      return MyAlertDialog.displayAlertDialog(
          context,
          'No Internet Connection :/',
          'You have to connect to the internet to continue to hang out on the application.',
          0xFFE57373);
    }
  }

  Future get10Posts(BuildContext context) async {
    var posts = [];
    try {
      http.Response response =
          await http.get(Uri.parse('$url/posts/take/post'));
      if (response.statusCode == 200) {
        var myposts = json.decode(response.body.toString());
        for (var mypost in myposts) {
          posts.add(mypost);
        }
      }
      return posts;
    } catch (_) {
      return MyAlertDialog.displayAlertDialog(
          context,
          'No Internet Connection :/',
          'You have to connect to the internet to continue to hang out on the application.',
          0xFFE57373);
    }
  }
}
