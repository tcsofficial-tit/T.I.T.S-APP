import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'attendance/attendance_controller.dart';
import 'attendance/attendance_model.dart';

class MyHomePageAttend extends StatefulWidget {
  MyHomePageAttend({required this.title});

  final String title;

  @override
  _MyHomePageStateAttend createState() => _MyHomePageStateAttend();
}

class _MyHomePageStateAttend extends State<MyHomePageAttend> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  bool _checkbox6 = false;
  bool _checkbox7 = false;
  bool _checkbox8 = false;
  bool _checkbox9 = false;
  String roll1 = "A";
  String roll2 = "A";
  String roll3 = "A";
  String roll4 = "A";
  String roll5 = "A";
  String roll6 = "A";
  String roll7 = "A";
  String roll8 = "A";
  String roll9 = "A";

  // TextField Controllers
  TextEditingController rollController = TextEditingController();
  //TextEditingController ce001Controller = TextEditingController();
  //TextEditingController ce002Controller = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.

      FeedbackForm feedbackForm = FeedbackForm(
        rollController.text,
        roll1,
        roll2,
        roll3,
        roll4,
        roll5,
        roll6,
        roll7,
        roll8,
        roll9,
      );

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: HexColor('#123e64'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: rollController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Valid Date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Date'),
                      ),
                      /*TextFormField(
                        controller: ce001Controller,
                        validator: (value) {
                          if (value!.contains("@")) {
                            return 'Enter Valid Attendance';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'ce001'
                        ),
                      ),
                      TextFormField(
                        controller: ce002Controller,
                        validator: (value) {
                          if (value!.trim().length == 10) {
                            return 'Enter 10 Digit Mobile Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'ce002',
                        ),
                      ),*/
                      Row(
                        children: [
                          Text("Roll No. CE001 : "),
                          Checkbox(
                            value: _checkbox1,
                            onChanged: (value) {
                              setState(() {
                                _checkbox1 = !_checkbox1;
                              });
                              if (!_checkbox1) {
                                roll1 = "A";
                              } else {
                                roll1 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Roll No. CE002 : "),
                          Checkbox(
                            value: _checkbox2,
                            onChanged: (value) {
                              setState(() {
                                _checkbox2 = !_checkbox2;
                              });
                              if (!_checkbox2) {
                                roll2 = "A";
                              } else {
                                roll2 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Roll No. Ce003 : "),
                          Checkbox(
                            value: _checkbox3,
                            onChanged: (value) {
                              setState(() {
                                _checkbox3 = !_checkbox3;
                              });
                              if (!_checkbox3) {
                                roll3 = "A";
                              } else {
                                roll3 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Roll No. CE004 : "),
                          Checkbox(
                            value: _checkbox4,
                            onChanged: (value) {
                              setState(() {
                                _checkbox4 = !_checkbox4;
                              });
                              if (!_checkbox4) {
                                roll4 = "A";
                              } else {
                                roll4 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Roll No. CE005 : "),
                          Checkbox(
                            value: _checkbox5,
                            onChanged: (value) {
                              setState(() {
                                _checkbox5 = !_checkbox5;
                              });
                              if (!_checkbox5) {
                                roll5 = "A";
                              } else {
                                roll5 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Roll No. CE006 : "),
                          Checkbox(
                            value: _checkbox6,
                            onChanged: (value) {
                              setState(() {
                                _checkbox6 = !_checkbox6;
                              });
                              if (!_checkbox6) {
                                roll6 = "A";
                              } else {
                                roll6 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Roll No. CE007 : "),
                          Checkbox(
                            value: _checkbox7,
                            onChanged: (value) {
                              setState(() {
                                _checkbox7 = !_checkbox7;
                              });
                              if (!_checkbox7) {
                                roll7 = "A";
                              } else {
                                roll7 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Roll No. CE008 : "),
                          Checkbox(
                            value: _checkbox8,
                            onChanged: (value) {
                              setState(() {
                                _checkbox8 = !_checkbox8;
                              });
                              if (!_checkbox8) {
                                roll8 = "A";
                              } else {
                                roll8 = "P";
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Roll No. CE009 : "),
                          Align(
                            alignment: Alignment.center,
                            child: Checkbox(
                              value: _checkbox9,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox9 = !_checkbox9;
                                });
                                if (!_checkbox9) {
                                  roll9 = "A";
                                } else {
                                  roll9 = "P";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
