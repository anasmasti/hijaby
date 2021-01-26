import 'package:flutter/material.dart';
import 'package:hijaby/data/fetchData.dart';
import 'package:hijaby/pages/functions/check_connexion.dart';
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
  List _seasons = [];

  @override
  void initState() {
    super.initState();
    CheckConnexion.checkConnexion(context);
  }

  @override
  void dispose() {
    super.dispose();
    CheckConnexion.checkConnexion(context).cancel();
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: BorderRadius.circular(34),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[350],
                      blurRadius: 18,
                      offset: Offset(0, .7))
                ]),
            padding: const EdgeInsets.only(top: 39.0, bottom: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      'Quick access to the most used pages',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 11, right: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorite');
                      },
                      color: Colors.yellow[600],
                      textColor: Colors.black87,
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 19,
                          ),
                          Text(
                            'Favorite',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          )
                        ],
                      ),
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 9, right: 9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorite');
                      },
                      color: Colors.deepPurple[50],
                      textColor: Colors.deepPurple[400],
                      child: Column(
                        children: [
                          Icon(
                            Icons.new_releases,
                            size: 19,
                          ),
                          Text(
                            'New',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          )
                        ],
                      ),
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 9, right: 9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorite');
                      },
                      color: Colors.deepPurple[50],
                      textColor: Colors.deepPurple[400],
                      child: Column(
                        children: [
                          Icon(
                            Icons.ac_unit,
                            size: 19,
                          ),
                          Text(
                            'Winter',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          )
                        ],
                      ),
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 9, right: 9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorite');
                      },
                      color: Colors.deepPurple[50],
                      textColor: Colors.deepPurple[400],
                      child: Column(
                        children: [
                          Icon(
                            Icons.wb_sunny,
                            size: 19,
                          ),
                          Text(
                            'Summer',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          )
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
                      padding: EdgeInsets.only(left: 12.0, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommend',
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
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowItem(
                                              index: index.toString(),
                                              title: _posts[index]['title']
                                                  .toString(),
                                              img: _posts[index]['img']
                                                  .toString(),
                                              id: _posts[index]['_id']
                                                  .toString(),
                                              desc: _posts[index]['desc']
                                                  .toString(),
                                              short_title: _posts[index]
                                                      ['short_title']
                                                  .toString(),
                                              short_desc: _posts[index]
                                                      ['short_desc']
                                                  .toString(),
                                              season: _posts[index]['season']
                                                  .toString(),
                                              createdAt: _posts[index]
                                                  ['createdAt'],
                                              nouveau: _posts[index]['nouveau'],
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
                                          EdgeInsets.only(top: 28, left: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${_posts[index]['title']}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${_posts[index]['title']}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.normal),
                                          )
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
                                              '${_posts[index]['img']}',
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
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
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
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 2,
                                  child: Container(
                                    width: 150,
                                    height: 80,
                                    padding: EdgeInsets.only(top: 28, left: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Summer',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Discover the summer collection',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.normal),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
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
                                          'https://images.unsplash.com/photo-1597240542691-2f5dd7834da0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80',
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: 150,
                                          color: Colors.black.withOpacity(.2),
                                          colorBlendMode: BlendMode.multiply,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
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
