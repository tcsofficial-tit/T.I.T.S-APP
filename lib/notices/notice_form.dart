/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String serial;
  String heading;
  String about;

  FeedbackForm(this.serial, this.heading, this.about);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['serial']}", "${json['heading']}", "${json['about']}");
  }

  // Method to make GET parameters.
  Map toJson() => {'serial': serial, 'heading': heading, 'about': about};
}
