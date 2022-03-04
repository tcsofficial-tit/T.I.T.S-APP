import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'first_widget.dart';

class Gallery extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Gallery> {
  static List<String> _images = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
    "6.jpeg",
    "7.jpg",
    "8.jpg",
    "9.jpg",
    "10.jpg",
    "11.jpg",
    "12.jpg",
    "13.jpg",
    "14.jpg",
    "15.jpg",
    "16.jpg",
    "17.jpg",
    "18.jpg",
    "19.jpg",
    "20.jpg",
    "21.jpg",
    "22.jpg",
    "23.jpg",
    "24.jpg",
    "25.jpg",
    "26.jpg",
    "27.jpg",
    "28.jpg",
    "29.jpg",
    "30.jpg",
    "31.jpg",
    "32.jpg",
    "33.jpg",
    "34.jpg",
    "35.jpg",
    "36.jpg",
    "37.jpg",
    "38.jpg",
    "39.jpg",
    "40.jpg",
    "41.jpg",
    "42.jpg",
    "43.jpg",
    "44.jpg",
  ];

  int x = 0;

  _image(int index) {
    return AssetImage(
      "assets/${_images[index]}",
      // height: 100,
      // width: 100,
    );
  }

  Widget _myAnimatedWidget = FirstWidget();

  var selectedItem = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#123e64'),
            centerTitle: true,
            elevation: 6,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text('Gallery'),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 4000),
                //Enable this for ScaleTransition
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: child,
                    turns: animation,
                  );
                },

                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 450,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                                image: _image(x), fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        left: 24, top: 5, bottom: 5, right: 24),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 12),
                decoration: BoxDecoration(),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: 'image$index',
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            x = index;
                            for (var item in _images) {
                              if (item == _images[index]) {
                                selectedItem = Border.all(
                                    color: Colors.blueGrey,
                                    style: BorderStyle.solid,
                                    width: 3);
                              } else {
                                selectedItem = Border.all(
                                    color: Colors.blueGrey,
                                    style: BorderStyle.solid,
                                    width: 3);
                              }
                            }
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: selectedItem,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: _image(index),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
