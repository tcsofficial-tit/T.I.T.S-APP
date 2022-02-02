import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tits_cs_department/profile.dart';

class member extends StatefulWidget {
  member({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<member> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    List<String> names = [
      "Dr. Mukesh Kumar",
      "Dr. Nidhi Sharma",
      "Mr. Anil Kumar",
      "Dr. Jyoti Choudhary",
      "Mr. Akhil Kaushik",
      "Mr. Ajit Singh",
      "Mr. Rajesh Kumar",
      "Mr. Surender Singh",
      "Mr. Sanjay Sharma",
      "Ms. Mukta Goal",
      "Ms. Jasmine",
      "Ms. Ritu Kalra",
      "Ms. Meenakshi Chawla",
      "Ms. Satvika",
      "Dr. Monika Sharma",
      "Ms. Archana",
      "Dr. G.K. Tyagi",
      "Dr.Amal Chowdhury",
      "Mr. Saumen Bhattacharya",
      "Dr. Ashvani Goyal",
      "Dr. Ajit Pattanayak",
      "Mr. Dhananjay Kumar",
      "Mr. Dharamendra Sharma",
      "Dr. Suman Bhatacharya",
      "Dr. Sudershan Dhamija",
      "Ms. Ritu Sharma",
      "Mr. Balbir Bedwal",
      "Ms. Akshita Jaiswal",
      "Mr. S.K. Malik",
      "Ms. Neha",
      "Mr. Amit Madhu",
      "Mr. Kamal Sardana",
      "Mr. Sunil Kumar",
      "Ms. Ritu Yadav",
      "Mr. Rohit Goel",
      "Mr. Satish KhaTak",
      "Mr. Rajeev Sharma",
      "Dr. K.N. Chatterjee",
      "Dr. Amandeep Kaur",
      "Dr. Shally Khanna",
      "Dr. Yamini Jhanji",
      "Mr. Ashish Bhradwaj",
      "Dr. Prem Sagar",
      "Mr. Mukesh Kumar",
      "Mr. Vikas",
      "Dr. Rajesh",
      "Dr. Amit Manocha",
      "Dr. A.K. Sachdeva",
      "Dr. Anu Kathuria",
      "Dr. Manoj Kr.Nanda",
      "Dr. Jasmeet Kaur",
      "Ms. Lima Pattanyak",
      "Mr. Parmod Kumar",
      "Mr. Vinay Kumar",
      "Mr. Raj Kumar",
      "Ms. Kritika",
      "Dr. S.K.Sharma",
      "Dr. Ajay Kumar",
      "Ms. Monika Sharma",
      "Ms. Charu Mani",
      "Ms. Surbhi Bhardwaj",
      "Dr.  Bhanwar Singh",
    ];
    List<String> skills = [
      "Associate Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Associate Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Professor",
      "Associate Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
      "Assistant Professor",
    ];
    List<String> batches = [
      "Computer Engineering",
      "Computer Engineering",
      "Computer Engineering",
      "Computer Engineering",
      "Computer Engineering",
      "Computer Engineering",
      "Computer Engineering",
      "Computer Engineering",
      "Computer Engineering",
      "Information Technology",
      "Information Technology",
      "Information Technology",
      "Information Technology",
      "Information Technology",
      "Information Technology",
      "Information Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Technology",
      "Textile Chemistry",
      "Textile Chemistry",
      "Textile Chemistry",
      "Textile Chemistry",
      "Electronic and Communication Engineering",
      "Electronic and Communication Engineering",
      "Electronic and Communication Engineering",
      "Electronic and Communication Engineering",
      "Electronic and Communication Engineering",
      "Electronic and Communication Engineering",
      "Fashion & Apparel Engineering",
      "Fashion & Apparel Engineering",
      "Fashion & Apparel Engineering",
      "Fashion & Apparel Engineering",
      "Fashion & Apparel Engineering",
      "Mechanical Engineering",
      "Mechanical Engineering",
      "Mechanical Engineering",
      "Mechanical Engineering",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Applied Science and Humanities",
      "Department of Management Studies",
      "Department of Management Studies",
      "Department of Management Studies",
      "Department of Management Studies",
      "Department of Management Studies",
      "Department of Management Studies",
    ];
    List<String> pics = [
      "assets/mukesh.png",
      "assets/tt/nidhi (1).jpg",
      "assets/tt/nidhi (1).png",
      "assets/tt/nidhi (2).jpg",
      "assets/tt/nidhi (3).jpg",
      "assets/tt/nidhi (4).jpg",
      "assets/tt/nidhi (5).jpg",
      "assets/tt/nidhi (6).jpg",
      "assets/tt/nidhi (7).jpg",
      "assets/tt/it (1).jpg",
      "assets/tt/it (2).jpg",
      "assets/tt/it (3).jpg",
      "assets/tt/it (4).jpg",
      "assets/tt/it (5).jpg",
      "assets/tt/it (6).jpg",
      "assets/tt/it (7).jpg",
      "assets/tt/tt (1).jpg",
      "assets/tt/tt (1).png",
      "assets/tt/tt (2).jpg",
      "assets/tt/tt (2).png",
      "assets/tt/tt (3).jpg",
      "assets/tt/tt (4).jpg",
      "assets/tt/tt (5).jpg",
      "assets/tt/tt (6).jpg",
      "assets/tt/tt (7).jpg",
      "assets/tt/tt (8).jpg",
      "assets/tt/tt (9).jpg",
      "assets/tt/tc (1).jpg",
      "assets/tt/tc (1).png",
      "assets/tt/tc (2).jpg",
      "assets/tt/tc (3).jpg",
      "assets/tt/ec (1).jpg",
      "assets/tt/ec (2).jpg",
      "assets/tt/ec (3).jpg",
      "assets/tt/ec (4).jpg",
      "assets/tt/ec (5).jpg",
      "assets/tt/ec (6).jpg",
      "assets/tt/a1.jpg",
      "assets/tt/a2.jpg",
      "assets/tt/a3.jpg",
      "assets/tt/a4.jpg",
      "assets/tt/a5.jpg",
      "assets/tt/a6.png",
      "assets/tt/a7.jpg",
      "assets/tt/a8.jpg",
      "assets/tt/a9.jpeg",
      "assets/tt/a10.jpg",
      "assets/tt/a11.jpg",
      "assets/tt/a12.jpg",
      "assets/tt/a13.jpg",
      "assets/tt/a14.jpg",
      "assets/tt/a15.jpg",
      "assets/tt/a16.png",
      "assets/tt/a17.jpg",
      "assets/tt/a18.jpg",
      "assets/tt/a19.jpg",
      "assets/tt/a20.jpg",
      "assets/tt/a21.jpg",
      "assets/tt/a22.jpg",
      "assets/tt/a23.jpg",
      "assets/tt/a24.jpg",
      "assets/tt/a25.jpg",
    ];
    var count = names.length;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor('#123e64'),
        centerTitle: true,
        title: Text(
          'Faculty',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: count,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.85,
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4),
          itemBuilder: (BuildContext, int index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => profile(
                          name: names[index],
                          skill: skills[index],
                          batch: batches[index],
                          pic: pics[index],
                        ));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white70,
                  shadowColor: Colors.black,
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: screenwidth * 0.30,
                        height: screenheight * 0.15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            pics[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        names[index],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
