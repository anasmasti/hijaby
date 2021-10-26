// ignore_for_file: no_logic_in_create_state, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hijaby/shared/components/footer.dart';
import 'package:hijaby/shared/functions/convertdate.dart';
import 'package:hijaby/shared/functions/var_to_text.dart';
import 'package:hijaby/pages/show_item.dart';

// ignore: must_be_immutable
class ShowAllItems extends StatefulWidget {
  ShowAllItems({
    required this.posts,
    required this.title,
  });

  List posts = [];
  String title = '';

  @override
  State<StatefulWidget> createState() {
    return ShowAllItemsState(posts, title);
  }
}

class ShowAllItemsState extends State<ShowAllItems> {
  List posts = [];
  String title = '';

  ShowAllItemsState(
    this.posts,
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 33, left: 14),
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
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          fontFamily: 'Roboto',
                          color: Colors.white),
                    ),
                    const Text(
                      'You can see all your favorite styles here',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
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
                itemCount: posts.length,
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
                                        title: posts[index]['title'].toString(),
                                        img: posts[index]['img'].toString(),
                                        id: posts[index]['_id'].toString(),
                                        desc: posts[index]['desc'].toString(),
                                        short_title: posts[index]['short_title']
                                            .toString(),
                                        short_desc: posts[index]['short_desc']
                                            .toString(),
                                        season: posts[index]['season']['name']
                                            .toString(),
                                        createdAt: posts[index]['createdAt'],
                                        nouveau: posts[index]['new'],
                                      )));
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
                                                      posts[index]['season']
                                                          ["name"],
                                                      12,
                                                      3,
                                                      9,
                                                      0,
                                                      4),
                                                  Text(
                                                    '${posts[index]['title'].substring(0, 10)}...',
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
                                                        '${posts[index]["short_desc"].substring(0, 25)}...',
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
                                                      'Published on : ${ConvertToDate.convertToDate(posts[index]["createdAt"])}',
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
                                        '${posts[index]["img"]}',
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
