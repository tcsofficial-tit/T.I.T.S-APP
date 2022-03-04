import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#123e64'),
        centerTitle: true,
        elevation: 6,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Feedback'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Give Your Feedback",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        hintText: "Mail Id"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        hintText: "Your Name"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone_android,
                          color: Colors.blue,
                        ),
                        hintText: "Mobile Number"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 90,
                  ),
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: "Your Feedback Here..."),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    height: 30,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color?>(Colors.blue)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
