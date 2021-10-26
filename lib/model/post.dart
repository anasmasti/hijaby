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
  final int postNouveau;

  Post({
    required this.postId,
    required this.postTitle,
    required this.postImg,
    required this.postDesc,
    // ignore: non_constant_identifier_names
    required this.postShort_title,
    // ignore: non_constant_identifier_names
    required this.postShort_desc,
    required this.postSeason,
    required this.postCreatedAt,
    required this.postNouveau,
  });

  static Post fromJson(Map<String, dynamic> json) => Post(
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

  Map<String, Object?> toJson() {
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
