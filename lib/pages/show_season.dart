import 'package:flutter/material.dart';
import 'package:hijaby/data/fetchData.dart';
import 'package:hijaby/pages/components/footer.dart';
import 'package:hijaby/pages/functions/convertdate.dart';
import 'package:hijaby/pages/functions/var_to_text.dart';
import 'package:hijaby/pages/show_item.dart';

// ignore: must_be_immutable
class ShowSeason extends StatefulWidget {
  ShowSeason({this.index, this.name, this.desc, this.img, this.id});
  String id;
  String desc;
  String img;
  String index;
  String name;

  @override
  State<StatefulWidget> createState() {
    return new ShowSeasonState(index, name, desc, img, id);
  }
}

class ShowSeasonState extends State<ShowSeason> {
  ShowSeasonState(this.index, this.name, this.desc, this.img, this.id);
  final String id;
  final String desc;
  final String img;
  final String index;
  final String name;

  List posts = [];

  @override
  void initState() {
    super.initState();
    FetchData().getPostsBySeasons(context, id).then((value) {
      setState(() {
        posts.addAll(value);
      });
    });
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
              Hero(
                tag: 'des$index',
                child: ClipRRect(
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
                      '$img',
                      fit: BoxFit.cover,
                      height: 320,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(.4),
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 33, left: 14, right: 14),
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
                padding: EdgeInsets.only(top: 170, left: 20, right: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      desc,
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
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.only(top: 6),
                                                    width: 120,
                                                    child: Text(
                                                        '${posts[index]["short_desc"].substring(0, 25)}...',
                                                        style: TextStyle(
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
          Footer(),
        ],
      ),
    );
  }
}
