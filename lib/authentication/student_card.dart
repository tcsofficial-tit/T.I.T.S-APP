import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'authentication_controller.dart';
import 'email_otp.dart';

class StudentCard extends StatelessWidget {
  final controller = Get.put(AuthenticationController());
  static late String name, email, rollNo, password;
  static final GlobalKey<FormState> _studentSignUpFormKey =
      GlobalKey<FormState>();
  static final GlobalKey<FormState> _studentLogInFormKey =
      GlobalKey<FormState>();
  StudentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VxGlassmorphic(
              opacity: 0.1,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: "Student".text.xl4.bold.white.make().shimmer(
                      primaryColor: Vx.gray200,
                      secondaryColor: Color.fromARGB(255, 8, 73, 126)))),
          SizedBox(
            height: 20,
          ),
          VxGlassmorphic(
            opacity: 0.1,
            width: Get.width * 0.9,
            child: Obx(
              () => CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  _buildTabButtons(context),
                  _buildStudentSignupForm(context),
                  _buildStudentLogInForm(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Widget _buildStudentCard(BuildContext context) {
  //   return Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         VxGlassmorphic(
  //             opacity: 0.1,
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: "Student".text.xl4.bold.white.make().shimmer(
  //                   primaryColor: Vx.warmGray100,
  //                   secondaryColor: Colors.purple),
  //             )),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         VxGlassmorphic(
  //           opacity: 0.1,
  //           width: Get.width * 0.9,
  //           child: Obx(
  //             () => CustomScrollView(
  //               shrinkWrap: true,
  //               slivers: [
  //                 _buildTabButtons(context),
  //                 _buildStudentSignupForm(context),
  //                 _buildStudentLogInForm(context),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildStudentLogInForm(BuildContext context) {
    return SliverVisibility(
      visible: controller.currentTabIndex.value == 0,
      sliver: SliverToBoxAdapter(
        child: Form(
          key: _studentLogInFormKey,
          child: Padding(
            padding: EdgeInsets.all(Get.width / 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildCustomTextFiledForEMail(_studentLogInFormKey),
                SizedBox(
                  height: 20,
                ),
                buildCustomTextFiledForPassword(_studentLogInFormKey),
                SizedBox(
                  height: 30,
                ),
                buildCustomButtonForLogin(context, _studentLogInFormKey)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStudentSignupForm(BuildContext context) {
    return SliverVisibility(
      visible: controller.currentTabIndex.value == 1,
      sliver: SliverToBoxAdapter(
        child: Form(
          key: _studentSignUpFormKey,
          child: Padding(
            padding: EdgeInsets.all(Get.width / 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildCustomTextFieldForRollNo(_studentSignUpFormKey),
                SizedBox(
                  height: 20,
                ),
                buildCustomTextFieldForName(_studentSignUpFormKey),
                SizedBox(
                  height: 20,
                ),
                buildCustomTextFiledForEMail(_studentSignUpFormKey),
                SizedBox(
                  height: 20,
                ),
                buildCustomTextFiledForPassword(_studentSignUpFormKey),
                SizedBox(
                  height: 30,
                ),
                buildCustomButtonForContinue(context, _studentSignUpFormKey)
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

  buildCustomButtonForLogin(
      BuildContext context, GlobalKey<FormState> formKey) {
    return CustomButton(
      text: "Log In",
      onPressed: () {
        if (formKey.currentState!.validate()) {
          logInToFb(context);
        }
      },
    );
  }

  void logInToFb(BuildContext context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((err) {
      // setState(() {
      //   isLoading = false;
      // });
      Get.log(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
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
    });
  }

  Widget _buildTabButtons(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.05,
      ),
      sliver: SliverToBoxAdapter(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
          child: TabBar(
            indicatorColor: Colors.white,
            controller: controller.tabController,
            onTap: controller.changeTab,
            tabs: [
              Tab(
                text: 'Login'.tr,
              ),
              Tab(
                text: 'New User'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
