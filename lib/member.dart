import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tits_cs_department/profile.dart';

class member extends StatefulWidget {
  member({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<member> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    List<String> names = [
      "Dr. Mukesh Kumar",
      "Dr. Nidhi Sharma",
      "Mr. Anil Kumar",
    ];
    List<String> skills = ["Associate Professor"];
    List<String> batches = ["Computer Engineering"];
    List<String> pics = [
      "assets/mukesh.png",
      "assets/nidhi(1).jpg",
      "assets/nidhi(1).png",
      "assets/nidhi(2).jpg",
      "assets/nidhi(3).jpg",
      "assets/nidhi(4).jpg",
      "assets/nidhi(5).jpg",
      "assets/nidhi(6).jpg",
      "assets/nidhi(7).jpg",
    ];
    var count = names.length;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text(
          'Faculty',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: count,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.9,
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4),
          itemBuilder: (BuildContext, int index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => profile(
                          name: names[index],
                          skill: skills[index],
                          batch: batches[index],
                          pic: pics[index],
                        ));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.black,
                  shadowColor: Colors.red,
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: screenwidth * 0.30,
                        height: screenheight * 0.15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            pics[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        names[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
