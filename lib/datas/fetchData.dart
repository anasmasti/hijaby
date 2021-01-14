import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchData {
  final url = 'https://jsonplaceholder.typicode.com';

  Future<List> getPosts() async {
    var posts = List();
    http.Response response = await http.get('$url/photos');
    if (response.statusCode == 200) {
      var myposts = json.decode(response.body.toString());
      for (var mypost in myposts) {
        posts.add(mypost);
      }
    }
    return posts;
  }
}
