import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tits_cs_department/ham.dart';
import 'package:tits_cs_department/place.dart';
import 'package:tits_cs_department/study_material/study_home.dart';
import 'package:tits_cs_department/test.dart';
import 'package:tits_cs_department/us.dart';
import 'package:tits_cs_department/web.dart';

import 'event.dart';
import 'fee.dart';
import 'feed.dart';
import 'gallary.dart';
import 'mark.dart';
import 'member.dart';
import 'note.dart';

var Images = [
  "assets/icons/1.jpg",
  "assets/icons/2.jpg",
  "assets/icons/3.png",
  "assets/icons/4.jpg",
  "assets/icons/5.jpg"
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  get scrollDirection => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: ham(),
      appBar: AppBar(backgroundColor: Color(0xff3da2dd), actions: [
        Hero(
            tag: 'TIT_Logo',
            child: Container(
              height: 35,
              width: 270,
              child: Image.asset(
                "assets/name.jpg",
                fit: BoxFit.fitWidth,
              ),
            )),
        IconButton(
          onPressed: () {
            FirebaseAuth auth = FirebaseAuth.instance;
            auth.signOut();
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )
      ]),
      body: Container(
        margin: EdgeInsets.only(top: 1),
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Container(
              height: 240,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 1, right: 1),
                  // Multipal images,
                  itemCount: Images.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 230,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            // user image
                            image: DecorationImage(
                              image: AssetImage(Images[index]),
                              fit: BoxFit.cover,
                            )));
                  })),
          Container(
            height: 25,
            width: 300,
            color: Color(0xffc5c8cb),
            child: Text('This is a simple text for show official notice',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //scroll
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => member()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 130,
                  width: 106,
                  child: Image.asset("assets/dirct.jpg", fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => member()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 130,
                  width: 106,
                  child: Image.asset("assets/parm.png", fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => member()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 130,
                  width: 106,
                  child:
                      Image.asset("assets/mukesh.jpeg", fit: BoxFit.fitWidth),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => member()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/member.jpeg'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Faculty',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => event()));
                },
                child: Container(
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/event.png'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Events',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudyMaterial()));
                },
                child: Container(
                  height: 90,
                  child: Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/study.jpeg'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Study',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      Text('Material',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => test()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/test.png'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Test Series',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Gallery()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 90,
                  child: Column(
                    children: const [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/gallary.jpeg'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Gallery',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => place()));
                },
                child: Container(
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/place.png'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Placements',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyWebView(
                              title:
                                  "The Technical Institute of Textile &sciences,Bhiwani",
                              selectedUrl: "https://titsbhiwani.ac.in/")));
                },
                child: Container(
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/web.jpeg'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Website',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => fee()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyWebView(
                              title:
                                  "The Technical Institute of Textile &sciences,Bhiwani",
                              selectedUrl:
                                  "https://titsbhiwani.ac.in/2019/index.php")));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/fee.png'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Fees',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => mark()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/mark.jpeg'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Mark Sheet',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => note()));
                },
                child: Container(
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/notes.jpeg'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Notice',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => us()));
                },
                child: Container(
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage("assets/about.png"),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('About Us',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => feed()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 90,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/feed.jpeg'),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Feedback',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
