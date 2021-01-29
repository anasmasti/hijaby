import 'package:flutter/material.dart';
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
                              0xFF2EE267);
                        } catch (_) {
                          return MyAlertDialog.displayAlertDialog(
                              context,
                              'Oups!',
                              'This item is already on your favorites list.',
                              0xFFFF5353);
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
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      padding: EdgeInsets.only(
                          top: 3, bottom: 3, left: 24, right: 24),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Winter',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
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
                Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(left: 12.0, right: 14, top: 30),
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
                                            'Recommend',
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
                        padding: EdgeInsets.only(left: 12.0),
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
                      padding:
                          const EdgeInsets.only(left: 12, top: 7, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.deepPurple[600],
                              textColor: Colors.blue.shade200,
                              child: Icon(
                                Icons.ac_unit,
                                size: 19,
                              ),
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 9, right: 9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.deepPurple[600],
                            textColor: Colors.green.shade200,
                            child: Icon(
                              Icons.local_florist_rounded,
                              size: 19,
                            ),
                            padding: EdgeInsets.only(
                                top: 4, bottom: 4, left: 9, right: 9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2, left: 2),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.deepPurple[600],
                              textColor: Colors.yellow.shade200,
                              child: Icon(
                                Icons.wb_sunny_outlined,
                                size: 19,
                              ),
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 9, right: 9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.deepPurple[600],
                            textColor: Colors.white,
                            child: Icon(
                              Icons.flash_on_outlined,
                              size: 19,
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
