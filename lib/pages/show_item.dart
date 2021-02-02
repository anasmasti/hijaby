import 'package:flutter/material.dart';
import 'package:hijaby/data/fetchData.dart';
import 'package:hijaby/model/post.dart';
import 'package:hijaby/data/databaseLocale.dart';
import 'package:hijaby/pages/components/alert_dialog.dart';
import 'package:hijaby/pages/components/footer.dart';
import 'package:hijaby/pages/functions/convertdate.dart';
import 'package:hijaby/pages/functions/var_to_text.dart';

// ignore: must_be_immutable
class ShowItem extends StatefulWidget {
  ShowItem(
      {this.index,
      this.id,
      this.title,
      this.img,
      this.desc,
      // ignore: non_constant_identifier_names
      this.short_title,
      // ignore: non_constant_identifier_names
      this.short_desc,
      this.season,
      this.createdAt,
      this.nouveau});

  String id;
  String img;
  String index;
  String title;
  String desc;
  // ignore: non_constant_identifier_names
  String short_title;
  // ignore: non_constant_identifier_names
  String short_desc;
  String season;
  String createdAt;
  bool nouveau;

  @override
  State<StatefulWidget> createState() {
    return new ShowItemState(index, id, title, img, desc, short_title,
        short_desc, season, createdAt, nouveau);
  }
}

class ShowItemState extends State<ShowItem> {
  ShowItemState(
      this.index,
      this.id,
      this.title,
      this.img,
      this.desc,
      this.short_title,
      this.short_desc,
      this.season,
      this.createdAt,
      this.nouveau);

  final String id;
  final String img;
  final String index;
  final String title;
  final String desc;
  // ignore: non_constant_identifier_names
  final String short_title;
  // ignore: non_constant_identifier_names
  final String short_desc;
  final String season;
  final String createdAt;
  final bool nouveau;
  // ignore: non_constant_identifier_names
  List _10Posts = [];

  @override
  void initState() {
    super.initState();
    FetchData().get10Posts().then((value) {
      setState(() {
        _10Posts.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final post = Post(
      postId: '$id',
      postTitle: "$title",
      postImg: '$img',
      postDesc: '$desc',
      postShort_title: '$short_title',
      postShort_desc: '$short_desc',
      postSeason: '$season',
      postCreatedAt: '$createdAt',
      postNouveau: 1,
    );
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Hero(
                tag: 'item_destination$index',
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
                      height: 290,
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
                    IconButton(
                      onPressed: () async {
                        try {
                          await DatabaseLocale.database.insertPost(post);
                          return MyAlertDialog.displayAlertDialog(
                              context,
                              'Done!',
                              'This item is on your favorites list now.',
                              0xFF81C784);
                        } catch (_) {
                          return MyAlertDialog.displayAlertDialog(
                              context,
                              'Oups!',
                              'This item is already on your favorites list.',
                              0xFFE57373);
                        }
                      },
                      icon: Icon(Icons.favorite_outline),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 115, left: 20, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   seasonTextToWigdet(season,14,6,14,0,6),
                    Text(
                      '$title' ?? '--',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          fontFamily: 'Roboto',
                          color: Colors.white),
                    ),
                    Text(
                      '$short_desc',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Published on : ${ConvertToDate.convertToDate(createdAt)}',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                fontSize: 11,
                                color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 24, right: 24),
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${boolNewToText(nouveau)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 14),
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 12.0, right: 14, top: 30, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Model',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Column(
                    children: [
                      InteractiveViewer(
                        child: Image.network(
                          '$img',
                          fit: BoxFit.cover,
                          height: 320,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 40, bottom: 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        short_title,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            color: Colors.black87),
                      ),
                      Text(
                        desc,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                            fontSize: 17,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(left: 12.0, right: 14, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'For you',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              'see all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.deepPurple.shade400),
                            )
                          ],
                        )),
                    Container(
                      height: 235,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _10Posts.length,
                          // ignore: missing_return
                          itemBuilder: (BuildContext context, int index) {
                            if (_10Posts.length == 0 || _10Posts.length < 0) {
                              return Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: Colors.deepPurple[200],
                              ));
                            } else if (_10Posts.length > 0) {
                              return Container(
                                margin: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowItem(
                                                  index: index.toString(),
                                                  title: _10Posts[index]
                                                          ['title']
                                                      .toString(),
                                                  img: _10Posts[index]['img']
                                                      .toString(),
                                                  id: _10Posts[index]['_id']
                                                      .toString(),
                                                  desc: _10Posts[index]['desc']
                                                      .toString(),
                                                  short_title: _10Posts[index]
                                                          ['short_title']
                                                      .toString(),
                                                  short_desc: _10Posts[index]
                                                          ['short_desc']
                                                      .toString(),
                                                  season: _10Posts[index]
                                                          ['season']
                                                      .toString(),
                                                  createdAt: _10Posts[index]
                                                      ['createdAt'],
                                                  nouveau: _10Posts[index]
                                                      ['new'],
                                                )));
                                  },
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 2,
                                        child: Container(
                                          width: 150,
                                          height: 80,
                                          padding: EdgeInsets.only(
                                              top: 23, left: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${_10Posts[index]['title']}',
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${_10Posts[index]['short_title']}',
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 3,
                                                          bottom: 3,
                                                          left: 12,
                                                          right: 12),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.green[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Text(
                                                        '${boolNewToText(_10Posts[index]['new'])}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 9,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                   seasonTextToWigdet(_10Posts[index]['season']["name"],12,3,9,0,0),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black26,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 5))
                                                  ]),
                                              child: Image.network(
                                                '${_10Posts[index]['img']}',
                                                fit: BoxFit.cover,
                                                height: 150,
                                                width: 150,
                                                color: Colors.black
                                                    .withOpacity(.2),
                                                colorBlendMode:
                                                    BlendMode.multiply,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Favorises',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 7, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/favorite');
                            },
                            color: Colors.deepPurple[200],
                            textColor: Colors.white,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite_outline,
                                  size: 29,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(
                                top: 4, bottom: 4, left: 9, right: 9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
