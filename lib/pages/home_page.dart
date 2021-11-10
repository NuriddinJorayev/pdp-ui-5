import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  final String id = "home_page";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
List<String> _imageList = [
 'assets/images/ic_hotel1.jpg',
 'assets/images/ic_hotel2.jpg',
 'assets/images/ic_hotel3.jpg',
 'assets/images/ic_hotel4.jpg',
 'assets/images/ic_hotel5.jpg',
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // header panel
            Container(
              height:( (MediaQuery.of(context).size.height)/3)-35,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ic_header.jpg'),
                fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.7),
                          Colors.black.withOpacity(.6),
                          Colors.black.withOpacity(.5),
                        ]
                    )
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text("Best Hotels Ever",
                        style: TextStyle(color: Colors.white, fontSize: 30.0,
                            fontWeight: FontWeight.bold, letterSpacing: 1.2),
                        textAlign: TextAlign.center),
                    ),
                    // @textfield panel
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40.0,
                          padding: EdgeInsets.symmetric(vertical: 1.0),
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search for hotels...",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // @body panel
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTextWithStyle("Business Hotrels"),
                  _listView_with_items_builder(_imageList),
                  _getTextWithStyle("Airport Hotrels"),
                  _listView_with_items_builder(_randomListImage()),
                  _getTextWithStyle("Resort Hotrels"),
                  _listView_with_items_builder(_randomListImage()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  // @listImages_random_items [1,2,3] == [2,1,3] or [3,1,2]
  List<String> _randomListImage(){
    List<String> list = [];
    for(int i = 0; i < _imageList.length; i++){
      bool bor = true;
      while(bor){
        int s = Random().nextInt(_imageList.length)+1 ;
        if (!list.contains('assets/images/ic_hotel$s.jpg')){
          list.add('assets/images/ic_hotel$s.jpg');
          break;
        }
      }
    }
    return list;
  }
   // @business, airport, resort, text builder
  Widget _getTextWithStyle(String s){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
        child: Text(s, style: TextStyle(color: Colors.grey[800],
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),));
  }
  // @List View child items builder function with container
  Widget _getListviewItmsBuilder(cxt, name, image){
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      height: cxt / 4.5,
      width: (MediaQuery.of(context).size.width / 2) - 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        ),
      ),
      child: Container(
        height: cxt / 4.5,
        width: (MediaQuery.of(context).size.width / 2) - 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.2),
                ]
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontSize: 20.0),),
                Icon(Icons.favorite, color: Colors.red,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  // @List View children all items builder function with row
  Widget _listView_with_items_builder(List listOne){
    List<Widget> widget_list = [];
    for(int i = 0; i < listOne.length; i++){
      widget_list.add(_getListviewItmsBuilder(MediaQuery.of(context).size.height,
          "Hotel ${i + 1}", listOne[i]),);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget_list,
      ),
    );
  }
}
