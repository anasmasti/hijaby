
import 'package:flutter/material.dart';
import 'package:hijaby/data/fetchData.dart';
import 'package:hijaby/pages/functions/check_connexion.dart';
import 'package:hijaby/pages/functions/var_to_text.dart';
import 'package:hijaby/pages/show_all_items.dart';
import 'package:hijaby/pages/show_item.dart';
import 'package:hijaby/pages/components/footer.dart';
import 'package:hijaby/pages/show_season.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  List _posts = [];
  // ignore: non_constant_identifier_names
  List _10Posts = [];
  List _newPosts = [];
  List _seasons = [];

  @override
  void initState() {
    super.initState();

   

    CheckConnexion.checkConnexion(context);

    FetchData().getPosts().then((value) {
      setState(() {
        _posts.addAll(value);
      });
    });

    FetchData().getSeasons().then((value) {
      setState(() {
        _seasons.addAll(value);
      });
    });

    FetchData().getNewPosts().then((value) {
      setState(() {
        _newPosts.addAll(value);
      });
    });

    FetchData().get10Posts().then((value) {
      setState(() {
        _10Posts.addAll(value);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    CheckConnexion.checkConnexion(context).cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 37.0, bottom: 10),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 11, right: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hijaby',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                          fontSize: 35),
                    ),
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
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 9, right: 9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: ListView(children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommend',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowAllItems(
                                            posts: _posts,
                                          )));
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.deepPurple.shade400),
                            ),
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
                                                title: _10Posts[index]['title']
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
                                                        ['season']['name']
                                                    .toString(),
                                                createdAt: _10Posts[index]
                                                    ['createdAt'],
                                                nouveau: _10Posts[index]['new'],
                                              )));
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 2,
                                      child: Container(
                                        width: 150,
                                        height: 80,
                                        padding:
                                            EdgeInsets.only(top: 23, left: 10),
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
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${_10Posts[index]['short_title']}',
                                              textDirection: TextDirection.ltr,
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
                                                      color: Colors.green[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Text(
                                                      '${boolNewToText(_10Posts[index]['new'])}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontFamily: 'Roboto',
                                                          fontSize: 9,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  seasonTextToWigdet(
                                                      _10Posts[index]['season']
                                                          ["name"],
                                                      12,
                                                      3,
                                                      9,
                                                      0,
                                                      0),
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
                                        Hero(
                                          tag: 'item_destination$index',
                                          child: ClipRRect(
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
                      padding: EdgeInsets.only(
                        left: 12.0,
                        right: 14,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'The four seasons',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      )),
                  Container(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _seasons.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowSeason(
                                          index: index.toString(),
                                          name: _seasons[index]['name']
                                              .toString(),
                                          desc: _seasons[index]['desc']
                                              .toString(),
                                          img:
                                              _seasons[index]['img'].toString(),
                                          id: _seasons[index]['_id'].toString(),
                                        )));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Hero(
                                  tag: 'des$index',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 5,
                                            offset: Offset(0, 5))
                                      ]),
                                      child: Image.network(
                                        '${_seasons[index]['img']}',
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: 250,
                                        color: Colors.black.withOpacity(.3),
                                        colorBlendMode: BlendMode.multiply,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(top: 50),
                                    child: Text(
                                      '${_seasons[index]['name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Novelties',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      )),
                  Container(
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _newPosts.length,
                        // ignore: missing_return
                        itemBuilder: (BuildContext context, int index) {
                          if (_newPosts.length == 0 || _newPosts.length < 0) {
                            return Center(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.deepPurple[200],
                            ));
                          } else if (_newPosts.length > 0) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowItem(
                                                index: index.toString(),
                                                title: _newPosts[index]['title']
                                                    .toString(),
                                                img: _newPosts[index]['img']
                                                    .toString(),
                                                id: _newPosts[index]['_id']
                                                    .toString(),
                                                desc: _newPosts[index]['desc']
                                                    .toString(),
                                                short_title: _newPosts[index]
                                                        ['short_title']
                                                    .toString(),
                                                short_desc: _newPosts[index]
                                                        ['short_desc']
                                                    .toString(),
                                                season: _newPosts[index]
                                                        ['season']['name']
                                                    .toString(),
                                                createdAt: _newPosts[index]
                                                    ['createdAt'],
                                                nouveau: _newPosts[index]
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
                                        padding:
                                            EdgeInsets.only(top: 23, left: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${_newPosts[index]['title']}',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${_newPosts[index]['short_title']}',
                                              textDirection: TextDirection.ltr,
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
                                                      color: Colors.green[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Text(
                                                      '${boolNewToText(_newPosts[index]['new'])}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontFamily: 'Roboto',
                                                          fontSize: 9,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  seasonTextToWigdet(
                                                      _newPosts[index]['season']
                                                          ["name"],
                                                      12,
                                                      3,
                                                      9,
                                                      0,
                                                      0),
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
                                              '${_newPosts[index]['img']}',
                                              fit: BoxFit.cover,
                                              height: 150,
                                              width: 150,
                                              color:
                                                  Colors.black.withOpacity(.2),
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
              Footer(),
            ]),
          ),
        ],
      ),
    );
  }
}
