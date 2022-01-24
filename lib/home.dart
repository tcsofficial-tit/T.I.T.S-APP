import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut();
            }, child: Text('Log out')),
            Text("Home"),
          ],
        ),
      ),

    );
  }
}