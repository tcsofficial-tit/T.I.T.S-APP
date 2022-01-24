import 'package:carousel_slider/carousel_slider.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tits_cs_department/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';


class EmailVerification extends StatefulWidget {
  String name, email, rollNo, password;
  EmailVerification(
      {Key? key,
      required this.name,
      required this.email,
      required this.rollNo,
      required this.password})
      : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  late String otp;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref("Users");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    emailAuth = EmailAuth(
      sessionName: "TIT&S",
    );

    /// Configuring the remote server

    // emailAuth.config(remoteServerConfiguration);
  }

  /// a void function to verify if the Data provided is true
  /// Convert it into a boolean function to match your needs.
  bool verify() {
    return emailAuth.validateOtp(recipientMail: widget.email, userOtp: otp);
  }

  /// a void funtion to send the OTP to the user
  /// Can also be converted into a Boolean function and render accordingly for providers
  void sendOtp() async {
    bool result =
        await emailAuth.sendOtp(recipientMail: widget.email, otpLength: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(const LinearGradient(colors: [
                Vx.blue500,
                Vx.purple600,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight))
              .make(),
          _buildEmailOtpForm(),
        ],
      ),
    );
  }

  Widget _buildEmailOtpForm() {
    return Center(
      child: VxGlassmorphic(
        opacity: 0.1,
        width: Get.width * 0.9,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(Get.width / 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildOTPsentText(),
                showEmail(),
                buildEnterOTPText(),
                Center(
                  child: otpInputFieldConfig(),
                ),
                buildCustomButtonForSignUp(context, _formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  otpInputFieldConfig() {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: true,
      obscuringCharacter: '*',
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (value) {
        if (value!.length < 6) {
          return 'Enter a 6 digit OTP';
        } else if (verify()) {
          return null;
        } else {
          return "Invalid OTP";
        }
      },
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent,
          inactiveColor: Colors.white),
      cursorColor: Colors.black,
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      // boxShadows: [
      //   BoxShadow(
      //     offset: Offset(0, 1),
      //     color: Colors.black12,
      //     blurRadius: 10,
      //   )
      // ],
      onSaved: (value) {
        setState(() {
          otp = value!;
        });
      },
      onChanged: (String value) {
        otp = value;
      },
    );
  }

  buildOTPsentText() {
    return const Text(
      'Verify the otp sent to your email address',
      style: TextStyle(fontSize: 22),
    );
  }

  showEmail() {
    final x = widget.email;
    return (x)
        .text
        .xl2
        .bold
        .white
        .make()
        .shimmer(primaryColor: Vx.black, secondaryColor: Colors.purple);
  }

  buildEnterOTPText() {
    return const Text('Enter OTP', style: TextStyle(fontSize: 22));
  }

  buildCustomButtonForSignUp(
      BuildContext context, GlobalKey<FormState> formKey) {
    return CustomButton(
      text: "Sign Up",
      onPressed: () {
        if (formKey.currentState!.validate()) {
          registerToFb();
        }
      },
    );
  }
  

  registerToFb() {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: widget.email, password: widget.password)
          .then((result) {
        // isLoading = false;
        Get.log(result.toString());
        dbRef.child(result.user!.uid).set({
          "email": widget.email,
          "name": widget.name,
          "rollNo": widget.rollNo.toUpperCase(),
        });
        
            Navigator.of(context).pop();
      });
    } on FirebaseException catch (err) {
      if (err.code == 'email-already-in-use') {
        // isLoading = false;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(err.message ?? ''),
                actions: [
                  ElevatedButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    } catch (e) {
      // isLoading = false;
      print(e);
    }
  }
}
