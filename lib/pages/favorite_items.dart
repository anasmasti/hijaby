import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hijaby/data/databaseLocale.dart';
import 'package:hijaby/model/post.dart';
import 'package:hijaby/pages/components/footer.dart';
import 'package:hijaby/pages/functions/convertdate.dart';
import 'package:hijaby/pages/show_item.dart';

// ignore: must_be_immutable
class FavoriteItems extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FavoriteItemsState();
  }
}

class FavoriteItemsState extends State<FavoriteItems> {
  List<Post> _posts = [];

  getFavoriteItems() async {
    List<Post> mydata = [];
    mydata = await DatabaseLocale.database.getAllPosts();
    setState(() {
      _posts = mydata;
    });
    return _posts;
  }

  @override
  void initState() {
    super.initState();
    getFavoriteItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 5))
                      ]),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1557682268-e3955ed5d83f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=486&q=80',
                    fit: BoxFit.cover,
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(.15),
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 33, left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 120, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Favorite' ?? '--',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      'You can see all your favorite styles here',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white70),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 14),
                scrollDirection: Axis.vertical,
                itemCount: _posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowItem(
                                      index: index.toString(),
                                      title: _posts[index].postTitle.toString(),
                                      img: _posts[index].postImg.toString(),
                                      id: _posts[index].postId.toString(),
                                      desc: _posts[index].postDesc.toString(),
                                      short_title: _posts[index]
                                          .postShort_title
                                          .toString(),
                                      short_desc: _posts[index]
                                          .postShort_desc
                                          .toString(),
                                      season:
                                          _posts[index].postSeason.toString(),
                                      createdAt: _posts[index].postCreatedAt,
                                      nouveau: _posts[index].postNouveau)));
                        },
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 155.0, top: 15),
                                  child: Container(
                                      width: 220,
                                      height: 140,
                                      padding:
                                          EdgeInsets.only(top: 18, left: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${_posts[index].postTitle}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Container(
                                                    width: 120,
                                                    child: Text(
                                                        '${_posts[index].postShort_desc}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      'Published on : ${ConvertToDate.convertToDate(_posts[index].postCreatedAt)}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Roboto',
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FlatButton(
                                                    onPressed: () async {
                                                      String myId =
                                                          _posts[index].postId;
                                                      await DatabaseLocale
                                                          .database
                                                          .deletePost(myId);
                                                    },
                                                    color: Colors.white,
                                                    textColor: Colors.red[300],
                                                    child: Icon(
                                                      Icons
                                                          .delete_forever_outlined,
                                                      size: 19,
                                                    ),
                                                    shape: CircleBorder(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Hero(
                                    tag: 'item_destination$index',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image.network(
                                        '${_posts[index].postImg}',
                                        fit: BoxFit.cover,
                                        height: 150,
                                        width: 150,
                                        color: Colors.black.withOpacity(.2),
                                        colorBlendMode: BlendMode.multiply,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Footer(),
        ],
      ),
    );
  }
}
