import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hijaby/pages/components/footer.dart';

// ignore: must_be_immutable
class ShowAllItems extends StatefulWidget {
  ShowAllItems({
    this.posts,
    this.title,
  });

  List posts = [];
  String title = '';

  @override
  State<StatefulWidget> createState() {
    return new ShowAllItemsState(posts, title);
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
              ClipRRect(
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [
                          const Color(0xFF762F9D),
                          const Color(0xFFAC6BE0),
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
                      },
                      icon: Icon(Icons.info_outline_rounded),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 140, left: 20, right: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All' ?? '--',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      'Summer is one of the four seasons of the year, in the temperate and polar regions of the planet. Summer follows spring and precedes fall.',
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
                scrollDirection: Axis.horizontal,
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Footer(),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
