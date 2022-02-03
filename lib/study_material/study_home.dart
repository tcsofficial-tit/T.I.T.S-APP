import 'package:flutter/material.dart';
import 'package:tits_cs_department/study_material/sem1.dart';
import 'package:tits_cs_department/study_material/sem2.dart';
import 'package:tits_cs_department/study_material/sem3.dart';
import 'package:tits_cs_department/study_material/sem4.dart';
import 'package:tits_cs_department/study_material/sem5.dart';
import 'package:tits_cs_department/study_material/sem6.dart';
import 'package:tits_cs_department/study_material/sem7.dart';
import 'package:tits_cs_department/study_material/sem8.dart';
import 'package:velocity_x/velocity_x.dart';

class StudyMaterial extends StatefulWidget {
  const StudyMaterial({Key? key}) : super(key: key);

  @override
  _StudyMaterialState createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {
  @override
  Widget build(BuildContext context) {
    // const urlImage =
    //     'https://images.unsplash.com/photo-1519145897500-869c40ccb024?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9';
    
    const urlImage =
    "https://data.whicdn.com/images/351706090/original.jpg";
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(urlImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag:'TIT_Logo',
                    child: VxGlassmorphic(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 39,
                              backgroundImage: AssetImage('assets/logo.png'),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    'TIT&S',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Computer Science Department',
                                    softWrap: true,
                                    style: TextStyle(            
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      children: <Widget>[
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://in.ewu.edu/ehs/wp-content/uploads/sites/116/bb-plugin/cache/Bad-ergonomics-circle.png",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem1()));
                                  },
                                  child: Text("Semester 1"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1)),
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://image.shutterstock.com/image-vector/boy-desk-260nw-310395152.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem2()));
                                  },
                                  child: Text("Semester 2"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1)),
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://c8.alamy.com/comp/T0X56A/illustration-of-a-kid-boy-wearing-headphones-and-speaking-through-microphone-recording-a-podcast-on-his-computer-T0X56A.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem3()));
                                  },
                                  child: Text("Semester 3"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1)),
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://cdn.pixabay.com/photo/2013/07/12/11/57/computer-144980_640.png",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem4()));
                                  },
                                  child: Text("Semester 4"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(),
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://4.imimg.com/data4/EU/KT/GLADMIN-15795765/2-250x250.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem5()));
                                  },
                                  child: Text("Semester 5"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1)),
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://i.pinimg.com/564x/c0/62/93/c06293545a66bee91879c4b11f4ac035.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem6()));
                                  },
                                  child: Text("Semester 6"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1)),
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://www.picgifs.com/clip-art/computer/computers/clip-art-computers-230466.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem7()));
                                  },
                                  child: Text("Semester 7"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1)),
                                  )),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                "https://fscomps.fotosearch.com/compc/IMZ/IMZ110/new-computer-drawing__pgi0142.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => sem8()));
                                  },
                                  child: Text("Semester 8"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1)),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
