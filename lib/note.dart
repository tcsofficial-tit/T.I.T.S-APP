import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tits_cs_department/notices/form_controller.dart';
import 'package:tits_cs_department/notices/notice_form.dart';

class FeedbackListPage extends StatefulWidget {
  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  // ignore: deprecated_member_use
  List<FeedbackForm> feedbackItems = <FeedbackForm>[];

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#123e64'),
        title: Text("Notice"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: feedbackItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.message_rounded),
                Expanded(
                  child: Text(
                      "${feedbackItems[index].serial} ${feedbackItems[index].heading}"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                  child: Text(feedbackItems[index].about),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
