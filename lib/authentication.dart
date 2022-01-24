import 'package:carousel_slider/carousel_slider.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tits_cs_department/email_otp.dart';
import 'package:tits_cs_department/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home.dart';
import 'widgets/custom_text_field.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({Key? key}) : super(key: key);
  late String name, email, rollNo, password;
  final GlobalKey<FormState> _studentFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _teachersFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cardList = [
      buildStudentCard(context),
      // buildStudentCard(),
      Text("LOL"),
    ];
    final RxInt selected_slider = 0.obs;
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
          CarouselSlider(
              options: CarouselOptions(
                height: Get.height,
                // aspectRatio: 2,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                // autoPlay: true,
                autoPlayInterval: 5.seconds,
                autoPlayAnimationDuration: 1000.milliseconds,
                autoPlayCurve: Curves.easeInOut,
                // enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) => selected_slider(index),
              ),
              items: cardList.map((card) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    card,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedSmoothIndicator(
                            count: 2,
                            effect: WormEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              activeDotColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              dotColor: Theme.of(context).indicatorColor,
                            ),
                            activeIndex: selected_slider.value,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }).toList()),
        ],
      ),
    );
  }

  Widget buildStudentCard(BuildContext context) {
    return Center(
      child: VxGlassmorphic(
        opacity: 0.1,
        width: Get.width * 0.9,
        child: Form(
          key: _studentFormKey,
          child: Padding(
            padding: EdgeInsets.all(Get.width / 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildCustomTextFieldForRollNo(_studentFormKey),
                SizedBox(
                  height: 20,
                ),
                buildCustomTextFieldForName(_studentFormKey),
                SizedBox(
                  height: 20,
                ),
                buildCustomTextFiledForEMail(_studentFormKey),
                SizedBox(
                  height: 20,
                ),
                buildCustomTextFiledForPassword(_studentFormKey),
                SizedBox(
                  height: 30,
                ),
                buildCustomButtonForContinue(context, _studentFormKey)
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField buildCustomTextFieldForName(GlobalKey<FormState> formKey) {
    return CustomTextField(
      prefixIcon: Icons.person,
      hintText: "Enter Full Name",
      inputType: TextInputType.name,
      onChanged: ((input) {
        name = input!;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Your Full Name';
        }
        formKey.currentState!.save();
        return null;
      },
    );
  }

  CustomTextField buildCustomTextFieldForRollNo(GlobalKey<FormState> formKey) {
    return CustomTextField(
      prefixIcon: Icons.list_alt_rounded,
      hintText: "Enter your college id",
      inputType: TextInputType.name,
      onChanged: ((input) {
        rollNo = input!;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Your college id';
        }
        formKey.currentState!.save();
        return null;
      },
    );
  }

  buildCustomTextFiledForEMail(GlobalKey<FormState> formKey) {
    return CustomTextField(
      prefixIcon: Icons.email,
      hintText: "Enter Email Address",
      inputType: TextInputType.emailAddress,
      onChanged: ((input) {
        email = input!;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter an Email Address';
        } else if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        formKey.currentState!.save();
        return null;
      },
    );
  }

  buildCustomTextFiledForPassword(GlobalKey<FormState> formKey) {
    return CustomTextField(
      obscureText: true,
      prefixIcon: Icons.password,
      hintText: "Enter Password",
      inputType: TextInputType.visiblePassword,
      onChanged: ((input) {
        password = input!;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter your password';
        } else if (value.length < 8) {
          return 'Password must be 8 digits long';
        } else if (value.isAlphabetOnly || value.isNumericOnly) {
          return 'Password must be alphanumeric';
        }
        formKey.currentState!.save();
        return null;
      },
    );
  }

  buildCustomButtonForContinue(
      BuildContext context, GlobalKey<FormState> formKey) {
    return CustomButton(
      text: "Continue",
      onPressed: () {
        if (formKey.currentState!.validate()) {
          EmailAuth emailAuth = EmailAuth(
            sessionName: "TIT&S",
          );

          emailAuth.sendOtp(recipientMail: email, otpLength: 6).then((_) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => EmailVerification(
                      email: email,
                      name: name,
                      rollNo: rollNo,
                      password: password,
                    )));
          });
        }
      },
    );
  }
}
