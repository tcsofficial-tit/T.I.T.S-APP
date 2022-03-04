class FeedbackForm {
  String roll;
  String ce001;
  String ce002;
  String ce003;
  String ce004;
  String ce005;
  String ce006;
  String ce007;
  String ce008;
  String ce009;

  FeedbackForm(this.roll, this.ce001, this.ce002, this.ce003, this.ce004,
      this.ce005, this.ce006, this.ce007, this.ce008, this.ce009);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['roll']}",
        "${json['ce001']}",
        "${json['ce002']}",
        "${json['ce003']}",
        "${json['ce004']}",
        "${json['ce005']}",
        "${json['ce006']}",
        "${json['ce007']}",
        "${json['ce008']}",
        "${json['ce009']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'roll': roll,
        'ce001': ce001,
        'ce002': ce002,
        'ce003': ce003,
        'ce004': ce004,
        'ce005': ce005,
        'ce006': ce006,
        'ce007': ce007,
        'ce008': ce008,
        'ce009': ce009,
      };
}
