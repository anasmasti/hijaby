import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hijaby/data/database_locale.dart';
import 'package:hijaby/model/post.dart';
import 'package:hijaby/shared/components/footer.dart';
import 'package:hijaby/shared/functions/convertdate.dart';
import 'package:hijaby/shared/functions/var_to_text.dart';
import 'package:hijaby/pages/show_item.dart';

// ignore: must_be_immutable
class FavoriteItems extends StatefulWidget {
  const FavoriteItems({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FavoriteItemsState();
  }
}

class FavoriteItemsState extends State<FavoriteItems> {
  List<Post> _posts = [];

  getFavoriteItems() async {
    List<Post> mydata = [];
    mydata = await DatabaseLocale.instance.getAllPosts();
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
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 13, left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 55, left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'My Favorites',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          color: Colors.white),
                    ),
                    Text(
                      'You can see all your favorite styles here',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 14),
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
                                      nouveau: true)));
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
                                      padding: const EdgeInsets.only(
                                          top: 18, left: 10),
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
                                                  seasonTextToWigdet(
                                                      _posts[index].postSeason,
                                                      12,
                                                      3,
                                                      9,
                                                      0,
                                                      4),
                                                  Text(
                                                    '${_posts[index].postTitle.substring(0, 10)}...',
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6),
                                                    width: 120,
                                                    child: Text(
                                                        '${_posts[index].postShort_desc.substring(0, 25)}...',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: Text(
                                                      'Published on : ${ConvertToDate.convertToDate(_posts[index].postCreatedAt)}',
                                                      style: const TextStyle(
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
                                                          .instance
                                                          .deletePost(myId);
                                                      getFavoriteItems();
                                                    },
                                                    color: Colors.white,
                                                    textColor: Colors.red[300],
                                                    child: const Icon(
                                                      Icons
                                                          .delete_forever_outlined,
                                                      size: 19,
                                                    ),
                                                    shape: const CircleBorder(),
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
                                        _posts[index].postImg,
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
          const Footer(),
        ],
      ),
    );
  }
}
