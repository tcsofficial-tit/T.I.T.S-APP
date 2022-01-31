import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tits_cs_department/us.dart';

import 'customText.dart';

class ham extends StatelessWidget {
  User? result = FirebaseAuth.instance.currentUser;
  ham({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Hero(
            tag: 'TIT_Logo',
            child: DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Row(children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 72, bottom: 94, top: 13),
                  child: const CustomHeader(
                    text: '',
                  ),
                ),
              ]),
            ),
          ),
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(),
            currentAccountPicture: Container(
                child: 
                result!.photoURL != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(result!.photoURL.toString()),
                      )
                    : 
                    CircleAvatar(
                        child: Text(
                          result?.email![0].toString() ?? '',
                          style: const TextStyle(fontSize: 30),
                        ),
                      )),
            accountEmail:
                Text(result?.email ?? '', style: TextStyle(color: Colors.black)),
            accountName: FutureBuilder(
                future: FirebaseDatabase.instance
                    .ref()
                    .child("Users")
                    .child(result!.uid)
                    .once(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data =
                        snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
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
                    return const CircularProgressIndicator();
                  }
                }),
          ),
          ListTile(
            title: CustomDescription(text: 'Profile'),
            onTap: () {},
          ),
          // ListTile(
          //   title: CustomDescription(text: 'A'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => us()),
          //     );
          //   },
          // ),
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
                MaterialPageRoute(builder: (context) => us()),
              );
            },
          ),
          ListTile(
            title: CustomDescription(text: 'Help'),
            onTap: () {},
          ),
          const SizedBox(
            height: 100,
          ),
          const ListTile(
              contentPadding: EdgeInsets.only(left: 16, top: 100),
              title: CustomDescription(text: 'Developed By TCS App Team'),
              subtitle: CustomDescription(text: 'version 1.0.1'),
              onTap: null),
        ],
      )),
    );
  }
}
