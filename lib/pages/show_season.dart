import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowSeason extends StatefulWidget {
  ShowSeason({this.index,this.name,this.desc,this.img});

  String desc;
  String img;
  String index;
  String name;

  @override
  State<StatefulWidget> createState() {
    return new ShowSeasonState(index,name,desc,img);
  }
}

class ShowSeasonState extends State<ShowSeason> {
  ShowSeasonState(this.index,this.name,this.desc,this.img);

  final String desc;
  final String img;
  final String index;
  final String name;

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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.info_outline_rounded),
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
                      name,
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
            child: ListView(
              padding: EdgeInsets.only(top: 14),
              children: [
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Summer recommend',
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
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New summer collection',
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
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Other season',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 30),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.deepPurple.shade100,
                            textColor: Colors.deepPurple.shade400,
                            child: Icon(
                              Icons.ac_unit,
                              size: 19,
                            ),
                            padding: EdgeInsets.all(16),
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
                            padding: EdgeInsets.all(16),
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
                            padding: EdgeInsets.all(16),
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
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
