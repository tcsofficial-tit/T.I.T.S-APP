import 'package:flutter/material.dart';

class feed extends StatefulWidget {
  const feed({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            SizedBox(height:300,),
            Text("Give Your Feedback",style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold,
            ),),
            SizedBox(height:30,),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email,color: Colors.red,),
                    hintText: "Mail Id"
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person,color: Colors.red,),
                    hintText: "Your Name"
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.phone_android, color: Colors.red,),
                    hintText: "Mobile Number"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90,),
              child: TextField(

                decoration: InputDecoration(
                    hintText: "Your Feedback Here..."
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
                color: Colors.red,
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                ),
                child: FlatButton(

                  onPressed: () {  },
                  child: Text("SUBMIT",style: TextStyle(color: Colors.white),),
                )
            )
          ],
        ),
      ),
    );
  }}