import 'package:flutter/material.dart';
import 'package:hijaby/datas/fetchData.dart';
import 'package:hijaby/pages/show_item.dart';
import 'package:hijaby/pages/components/footer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  List _posts = List();

  @override
  Widget build(BuildContext context) {
    FetchData().getPosts().then((value) {
      setState(() {
        _posts.addAll(value);
      });
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        children: [
          Hero(
            tag: 'splash',
            child: Container(
              decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      const Color(0xff9640c4),
                      const Color(0xff6c40c4),
                    ],
                    begin: const FractionalOffset(1, 0),
                    end: const FractionalOffset(1, 1),
                  ),
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 18,
                        offset: Offset(0, .7))
                  ]),
              padding: const EdgeInsets.only(top: 39.0, bottom: 27),
              child: Column(children: [
                Text(
                  'How is the weather at home?',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade50,
                      fontSize: 25.0),
                ),
                SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.deepPurple.shade100,
                      textColor: Colors.deepPurple.shade400,
                      child: Icon(
                        Icons.ac_unit,
                        size: 19,
                      ),
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.deepPurple.shade100,
                      textColor: Colors.deepPurple.shade400,
                      child: Icon(
                        Icons.local_florist_rounded,
                        size: 19,
                      ),
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.deepPurple.shade100,
                      textColor: Colors.deepPurple.shade400,
                      child: Icon(
                        Icons.wb_sunny_outlined,
                        size: 19,
                      ),
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.deepPurple.shade100,
                      textColor: Colors.deepPurple.shade400,
                      child: Icon(
                        Icons.flash_on_outlined,
                        size: 19,
                      ),
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              ]),
            ),
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
                                              id: _posts[index]['id']
                                                  .toString(),
                                              title: _posts[index]['title']
                                                  .toString(),
                                              url: _posts[index]['url']
                                                  .toString(),
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
                                            '${_posts[index]['id']}',
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
                                        tag:
                                            'item_destination${_posts[index]['id']}',
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
                                              '${_posts[index]['url']}',
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
                      padding: EdgeInsets.only(left: 12.0, right: 14,),
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
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/season');
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Hero(
                                tag: 'des',
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
                                      'https://images.pexels.com/photos/3601425/pexels-photo-3601425.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
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
                                    'Summer',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(0, 5))
                                ]),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1548343874-ea7b35b1fd4a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8aGlqYWJ8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 250,
                                  color: Colors.black.withOpacity(.1),
                                  colorBlendMode: BlendMode.multiply,
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 50),
                                child: Text(
                                  'Spring',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(0, 5))
                                ]),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1551582045-6ec9c11d8697?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80',
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 250,
                                  color: Colors.black.withOpacity(.4),
                                  colorBlendMode: BlendMode.multiply,
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 50),
                                child: Text(
                                  'Winter',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(0, 5))
                                ]),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1544059529-9a9a0a4ef94f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTAxfHxoaWphYnxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 250,
                                  color: Colors.black.withOpacity(.2),
                                  colorBlendMode: BlendMode.multiply,
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 50),
                                child: Text(
                                  'Fall',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ),
                    ]),
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
