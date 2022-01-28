import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tits_cs_department/us.dart';

import 'customText.dart';

class ham extends StatelessWidget {
  User? result=FirebaseAuth.instance.currentUser;
  ham({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("fblogo.jpg"),
                    fit: BoxFit.cover,
                  ),

                ),
                child: Row(
                    children: <Widget> [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 72, bottom: 94,top: 13),
                        child: CustomHeader(
                          text: 'TIT',
                        ),
                      ),

                    ]
                ),
              ),
              UserAccountsDrawerHeader(
                decoration:BoxDecoration(
                ),
                currentAccountPicture: Container(
                  child: result!.photoURL!=null?CircleAvatar(backgroundImage: NetworkImage(result?.photoURL.toString()??''),)
                      :CircleAvatar(
                    child: Text(result?.email![0].toString()??'',style: TextStyle(fontSize: 30),),
                  )
                ),
                accountEmail: FutureBuilder(
                    future: FirebaseDatabase.instance
                        .reference()
                        .child("Users")
                        .child(result?.uid.toString()??'')
                        .once(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.value['email'],style: TextStyle(color: Colors.black12 ));
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                accountName: FutureBuilder(
                    future: FirebaseDatabase.instance
                        .reference()
                        .child("Users")
                        .child(result!.uid)
                        .once(),
                    builder: (context,AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.value['name'],style: TextStyle(color: Colors.black),);
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              ListTile(
                title: CustomDescription(text: 'Profile'),
                onTap: () {
                },

              ),
                  ListTile(
                title: CustomDescription(text: 'A'),
                onTap: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => us()),
                  );
                },
              ),
              ListTile(
                title: CustomDescription(text: 'Logout'),
                onTap: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut();
                },
              ),
              ListTile(
                title: CustomDescription(text: 'About Us'),
                onTap: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => us()),
                  );
                },
              ),

              ListTile(
                title: CustomDescription(text: 'Help'),
                onTap: () {
                },
              ),
              SizedBox(
                height: 100,
              ),

              ListTile(
                  contentPadding: EdgeInsets.only(left:16,top: 100),
                  title: CustomDescription(text: 'Developed By TCS App Team'),
                  subtitle: CustomDescription(text: 'version 1.1.0101'),
                  onTap: null
              ),
            ],)

    );
  }
}
