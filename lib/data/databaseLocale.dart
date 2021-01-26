import 'dart:async';
import 'dart:io';
import 'package:hijaby/model/post.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseLocale {
  DatabaseLocale._();
  static final DatabaseLocale database = DatabaseLocale._();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'post_db.db');
    var myDb = await openDatabase(path, version: 2, onCreate: _createDb);
    return myDb;
  }

  _createDb(Database db, int newVersion) async {
    String sql =
        "CREATE TABLE posts( id VARCHAR(50) PRIMARY KEY, title VARCHAR(50), img VARCHAR(200), createdAt VARCHAR(50), short_title VARCHAR(100),short_desc VARCHAR(100),season VARCHAR(50), desc VARCHAR(500), nouveau BOOL)";
    await db.execute(sql);
  }
  // _updateDb(Database db, int oldVersion, int newVersion) async {
  //   if (oldVersion < newVersion) {
  //   //  await db.execute("ALTER TABLE posts ALTER COLUMN createdAt DATETIME;");
  //    await db.execute("Delete * FROM posts");
  //   }
  // }

  insertPost(Post post) async {
    final Database dbPost = await db;

    int result = await dbPost.rawInsert(
      "INSERT INTO posts (id, title, img, desc, short_title, short_desc, season, createdAt, nouveau) VALUES ('${post.postId}', '${post.postTitle}', '${post.postImg}', '${post.postDesc}', '${post.postShort_title}', '${post.postShort_desc}', '${post.postSeason}', '${post.postCreatedAt}', '${post.postNouveau}')",
    );
    return result;
  }

  Future<List<Post>> getAllPosts() async {
    final Database dbPost = await db;
    List<Map> result = await dbPost.rawQuery('SELECT * FROM posts');
    List<Post> posts = [];
    result.forEach((result) {
      Post post = Post.fromMap(result);
      posts.add(post);
    });
    return posts;
  }

  deletePost(String id) async {
    final Database dbPost = await db;
    dbPost.rawQuery("Delete FROM posts WHERE id = '$id'");
  }

  deleteAllPosts() async {
    final Database dbPost = await db;
    dbPost.rawQuery("Delete * FROM posts");
  }
}
