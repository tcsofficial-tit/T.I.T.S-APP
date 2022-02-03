import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tits_cs_department/study_material/pdf_view.dart';

class sem3 extends StatefulWidget {
  const sem3({Key? key}) : super(key: key);

  @override
  _sem3State createState() => _sem3State();
}

class _sem3State extends State<sem3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
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
                                            builder: (context) => pdf()));
                                  },
                                  child: Text("DBMS"),
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
                                            builder: (context) => pdf()));
                                  },
                                  child: Text("DSA"),
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
                                            builder: (context) => pdf()));
                                  },
                                  child: Text("Python"),
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
                                            builder: (context) => pdf()));
                                  },
                                  child: Text("Economics"),
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
                                "https://image.shutterstock.com/image-vector/boy-desk-260nw-310395152.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => pdf()));
                                  },
                                  child: Text("DE"),
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
                                "https://www.picgifs.com/clip-art/computer/computers/clip-art-computers-230466.jpg",
                                height: 120,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => pdf()));
                                  },
                                  child: Text("Math"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(),
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
