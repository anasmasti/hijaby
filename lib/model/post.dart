import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromMap(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Post {
  final String postId;
  final String postTitle;
  final String postImg;
  final String postDesc;
  // ignore: non_constant_identifier_names
  final String postShort_title;
  // ignore: non_constant_identifier_names
  final String postShort_desc;
  final String postSeason;
  final String postCreatedAt;
  final bool postNouveau;

  Post({
    this.postId,
    this.postTitle,
    this.postImg,
    this.postDesc,
    // ignore: non_constant_identifier_names
    this.postShort_title,
    // ignore: non_constant_identifier_names
    this.postShort_desc,
    this.postSeason,
    this.postCreatedAt,
    this.postNouveau,
  });

  factory Post.fromMap(Map<String, dynamic> json) => new Post(
        postId: json["id"],
        postTitle: json["title"],
        postImg: json["img"],
        postDesc: json["desc"],
        postShort_title: json["short_title"],
        postShort_desc: json["short_desc"],
        postSeason: json["season"],
        postCreatedAt: json["createdAt"],
        postNouveau: json["nouveau"],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': postId,
      'title': postTitle,
      'img': postImg,
      'desc': postDesc,
      'short_title': postShort_title,
      'short_desc': postShort_desc,
      'season': postSeason,
      'createdAt': postCreatedAt,
      'nouveau': postNouveau,
    };
  }
}
