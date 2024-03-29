import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hijaby/ads/admob.dart';
import 'package:hijaby/data/fetch_data.dart';
import 'package:hijaby/pages/show_all_items.dart';
import 'package:hijaby/pages/show_item.dart';
import 'package:hijaby/pages/show_season.dart';
import 'package:hijaby/shared/components/alert_dialog.dart';
import 'package:hijaby/shared/functions/check_connexion.dart';
import 'package:hijaby/shared/functions/var_to_text.dart';
import 'package:hijaby/shared/components/footer.dart';
import 'package:hijaby/shared/components/header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List _posts = [];
  // ignore: non_constant_identifier_names
  final List _10Posts = [];
  final List _newPosts = [];
  final List _seasons = [];
  late BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();

    _bannerAd = Admob.getBanner();
    _bannerAd.load();

    setState(() {
      CheckConnexion.checkConnexion(context);
    });

    FetchData().getPosts(context).then((value) {
      setState(() {
        _posts.addAll(value);
      });
    });

    FetchData().getSeasons(context).then((value) {
      setState(() {
        _seasons.addAll(value);
      });
    });

    FetchData().getNewPosts(context).then((value) {
      setState(() {
        _newPosts.addAll(value);
      });
    });

    FetchData().get10Posts(context).then((value) {
      setState(() {
        _10Posts.addAll(value);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    CheckConnexion.checkConnexion(context).cancel();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: _bannerAd);
    final SizedBox adContainer = SizedBox(
      child: adWidget,
      width: _bannerAd.size.width.toDouble(),
      height: _bannerAd.size.height.toDouble(),
    );
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      bottomNavigationBar: adContainer,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 47.0, bottom: 3),
            child: Column(children: const [Header()]),
          ),
          Expanded(
            child: ListView(children: [
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recommend',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowAllItems(
                                            posts: _posts,
                                            title: '',
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
                  SizedBox(
                    height: 235,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _10Posts.length,
                        // ignore: missing_return
                        itemBuilder: (BuildContext context, int index) {
                          if (_10Posts.isEmpty) {
                            return Center(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.deepPurple[200],
                            ));
                          } else if (_10Posts.isNotEmpty) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      // ignore: missing_return
                                      builder: (context) {
                                    if (_10Posts.isNotEmpty) {
                                      return ShowItem(
                                        index: index.toString(),
                                        title:
                                            _10Posts[index]['title'].toString(),
                                        img: _10Posts[index]['img'].toString(),
                                        id: _10Posts[index]['_id'].toString(),
                                        desc:
                                            _10Posts[index]['desc'].toString(),
                                        short_title: _10Posts[index]
                                                ['short_title']
                                            .toString(),
                                        short_desc: _10Posts[index]
                                                ['short_desc']
                                            .toString(),
                                        season: _10Posts[index]['season']
                                                ['name']
                                            .toString(),
                                        createdAt: _10Posts[index]['createdAt'],
                                        nouveau: _10Posts[index]['new'],
                                      );
                                    } else if (_10Posts.isEmpty) {
                                      MyAlertDialog.displayAlertDialog(
                                          context,
                                          'No Internet Connection :/',
                                          'You have to connect to the internet to continue to hang out on the application.',
                                          0xFFE57373);
                                    }
                                    return const Text('loading...');
                                  }));
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 2,
                                      child: Container(
                                        width: 150,
                                        height: 80,
                                        padding: const EdgeInsets.only(
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
                                              textDirection: TextDirection.ltr,
                                              style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${_10Posts[index]['short_title']}',
                                              textDirection: TextDirection.ltr,
                                              style: const TextStyle(
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
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                      style: const TextStyle(
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
                                                  boxShadow: const [
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
                          return const Text('loading...');
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 14,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'The four seasons',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _seasons.length,
                      // ignore: missing_return
                      itemBuilder: (BuildContext context, int index) {
                        if (_seasons.isNotEmpty) {
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
                                            img: _seasons[index]['img']
                                                .toString(),
                                            id: _seasons[index]['_id']
                                                .toString(),
                                          )));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Hero(
                                    tag: 'des$index',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            boxShadow: [
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
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Text(
                                        '${_seasons[index]['name']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          );
                        } else if (_seasons.isEmpty) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.deepPurple[200],
                          ));
                        }
                        return const Text('loading...');
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Novelties',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 235,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _newPosts.length,
                        // ignore: missing_return
                        itemBuilder: (BuildContext context, int index) {
                          if (_newPosts.isEmpty) {
                            return Center(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.deepPurple[200],
                            ));
                          } else if (_newPosts.isNotEmpty) {
                            return Container(
                              margin: const EdgeInsets.all(10),
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
                                        padding: const EdgeInsets.only(
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
                                              '${_newPosts[index]['title']}',
                                              textDirection: TextDirection.ltr,
                                              style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${_newPosts[index]['short_title']}',
                                              textDirection: TextDirection.ltr,
                                              style: const TextStyle(
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
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                      style: const TextStyle(
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
                                                boxShadow: const [
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
                          return const Text('loading...');
                        }),
                  )
                ],
              ),
              const Footer(),
            ]),
          ),
        ],
      ),
    );
  }
}
