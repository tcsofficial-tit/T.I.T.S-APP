import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
    final RxInt selected_slider = 0.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: ham(),
      appBar: AppBar(
          backgroundColor: HexColor('#123e64'),
          title: Image(image: AssetImage("assets/name.jpg")),
          centerTitle: true,
          actions: [
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
        margin: const EdgeInsets.only(top: 1),
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.75,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: 3.5.seconds,
              autoPlayAnimationDuration: 1000.milliseconds,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) => selected_slider(index),
            ),
            items: Images.map((String image) {
              return Builder(builder: (BuildContext context) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(9)),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: FadeInImage(
                          placeholder: AssetImage(image),
                          image: AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedSmoothIndicator(
                            count: Images.length,
                            effect: WormEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              activeDotColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              dotColor: Theme.of(context).indicatorColor,
                            ),
                            activeIndex: selected_slider.value,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              });
            }).toList(),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 25,
            width: 300,
            color: Color(0xffc5c8cb),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => note()));
              },
              child: Marquee(
                  blankSpace: 100,
                  text: 'This is a simple text for show official notice.',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => member()));
                },
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      // margin: const EdgeInsets.only(left: 10),
                      height: 130,
                      width: context.width * 0.28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                            Image.asset("assets/dirct.jpg", fit: BoxFit.cover),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => member()));
                },
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      // margin: EdgeInsets.only(left: 10),
                      height: 130,
                      width: context.width * 0.28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                            Image.asset("assets/parm.png", fit: BoxFit.cover),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => member()));
                },
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      // margin: EdgeInsets.only(left: 10, right: 10),
                      height: 130,
                      width: context.width * 0.28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/mukesh.jpeg",
                            fit: BoxFit.fitWidth),
                      )),
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
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyTestView(
                                selectedUrl:
                                    'https://testseries.ezexam.in/online-exams/',
                                title: 'TIT Test Series',
                              )));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedBack()));
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
