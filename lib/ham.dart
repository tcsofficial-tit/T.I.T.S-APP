import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tits_cs_department/us.dart';

import 'customText.dart';

class ham extends StatelessWidget {
  User? result = FirebaseAuth.instance.currentUser;
  ham({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          backgroundColor: HexColor('#123e64'),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(),
                currentAccountPicture: Container(
                    child: result!.photoURL != null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(result!.photoURL.toString()),
                          )
                        : CircleAvatar(
                            child: Text(
                              result?.email![0].toString() ?? '',
                              style: const TextStyle(fontSize: 30),
                            ),
                          )),
                accountEmail: Text(result?.email ?? '',
                    style: TextStyle(color: Colors.black)),
                accountName: FutureBuilder(
                    future: FirebaseDatabase.instance
                        .ref()
                        .child("Users")
                        .child(result!.uid)
                        .once(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data?.snapshot.value
                            as Map<dynamic, dynamic>;
                        return Row(
                          children: [
                            Text(data["rollNo"] ?? '',
                                style: TextStyle(color: Colors.black)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(data["name"] ?? '',
                                style: TextStyle(color: Colors.black)),
                          ],
                        );
                      } else {
                        return const PlaceholderLines(
                          animate: true,
                          count: 1,
                        );
                      }
                    }),
              ),
              ListTile(
                title: CustomDescription(text: 'Profile'),
                onTap: () {},
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
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),
              ListTile(
                title: CustomDescription(text: 'Help'),
                onTap: () {},
              ),
              const SizedBox(
                height: 200,
              ),
              GestureDetector(
                child: ListTile(
                    contentPadding: EdgeInsets.only(left: 16, top: 100),
                    title: CustomDescription(text: 'Developed By TCS App Team'),
                    subtitle: CustomDescription(text: 'version 1.0.1'),
                    onTap: null),
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),
            ],
          )),
    );
  }
}
