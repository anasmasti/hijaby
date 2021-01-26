import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class FetchData {
  final url = 'https://hijaby.herokuapp.com/api';

  Future getPosts() async {
    var posts = [];
    try {
      http.Response response = await http.get('$url/posts');
      if (response.statusCode == 200) {
        var myposts = json.decode(response.body.toString());
        for (var mypost in myposts) {
          posts.add(mypost);
        }
      }
      return posts;
    } catch (_) {
      print('connexion error');
    }
  }

  Future getSeasons() async {
    var seasons = [];
    try {
      http.Response response = await http.get('$url/seasons');
      if (response.statusCode == 200) {
        var myseasons = json.decode(response.body.toString());
        for (var myseason in myseasons) {
          seasons.add(myseason);
        }
      }
      return seasons;
    } catch (_) {
      print('connexion error');
    }
  }
}
