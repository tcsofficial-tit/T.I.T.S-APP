import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Developers extends StatelessWidget {
  launchURL(String $url_id) async {
    var url = $url_id;
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }

  List<String> developer_images = [
    // "https://drive.google.com/uc?export=view&id=145_-Ynrr03L9EFVqz7jq4BcOnVEvtqTf",
    "assets/developers/ansh.jpg",
    "assets/developers/aman.jpg",
    "assets/developers/Deep.jpg",
  ];
  List<String> developer_names = ["Ansh Agrawal", "Aman Singh", "Deepanshu"];
  List<String> developer_descriptions = [
    "Team Lead and Lead Developer",
    "Lead Developer",
    "Lead Developer"
  ];
  List<String> developer_linkedin_urls = [
    "https://www.linkedin.com/in/ansh-agrawal-03480b202",
    "https://www.linkedin.com/in/aman-singh-8a5892191/",
    "NULL"
  ];
  var total_developers = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          // backgroundColor: Colors.grey[850],
          backgroundColor: HexColor('#123e64'),
          title: Text("Developers"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: CarouselSlider.builder(
            itemCount: total_developers,
            itemBuilder: (context, index, realIDX) {
              return Card(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((20)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 250,
                      width: 300,
                      child: Center(
                        child: Image.asset(developer_images[index]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      developer_names[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      developer_descriptions[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchURL(developer_linkedin_urls[index]);
                      },
                      child: ElevatedButton(
                          onPressed: () {
                            //var url = developer_linkedin_urls[index];
                            //launchURL(url);
                          },
                          child: Text(
                            'View Profile',
                          )),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 20.0,
              enlargeCenterPage: true,
              height: 520,
              viewportFraction: 0.78,
              autoPlayAnimationDuration: Duration(seconds: 2),
              pauseAutoPlayOnTouch: true,
            ),
          ),
        ),
      ),
    );
  }
}
