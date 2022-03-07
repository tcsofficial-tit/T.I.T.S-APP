import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tits_cs_department/attend.dart';

String yearPass = "2023";
String semesterPass = "Semester 1";

class AttendDrop extends StatefulWidget {
  const AttendDrop({Key? key}) : super(key: key);

  @override
  _AttendDropState createState() => _AttendDropState();
}

class _AttendDropState extends State<AttendDrop> {
// Initial Selected Value
  String year_value = 'Year 2022';
  String semester_value = "Semester 1";

// List of items in our dropdown menu
  var year = [
    'Year 2022',
    'Year 2023',
    'Year 2024',
    'Year 2025',
    'Year 2026',
    'Year 2027',
  ];
  var semester = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#123e64'),
        title: const Text("Attendance"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            DropdownButton(
              // Initial Value
              value: year_value,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: year.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  year_value = newValue!;
                  yearPass = year_value;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            DropdownButton(
              // Initial Value
              value: semester_value,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: semester.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  semester_value = newValue!;
                  semesterPass = semester_value;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePageAttend(
                              title: 'Attendance',
                            )));
              },
              child: Card(
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 20,
                color: Color.fromARGB(255, 18, 133, 226),
                child: Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: 40,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Text(
                        "Proceed",
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Dictionary+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
String temp =
    "https://script.google.com/macros/s/AKfycbwYJbpAgkYZhFsirCw2FKg5cJxbo78MkBuL9EHm0F0dDybMgb1fKRbgCLbWPQ1hYnkn/exec";
var dict_names = {
  '2022': {
    'Semester 1':
        "https://script.google.com/macros/s/AKfycbwYJbpAgkYZhFsirCw2FKg5cJxbo78MkBuL9EHm0F0dDybMgb1fKRbgCLbWPQ1hYnkn/exec",
    'Semester 2': 'lawn',
    'Semester 3': 'man'
  },
  '2023': {'Semester 1': 'spot', 'place': 'bed', 'animal': 'dog'}
};
print(yearPass) {
  // TODO: implement print
  throw UnimplementedError();
}

String? tempPass = dict_names[yearPass]![semesterPass];
