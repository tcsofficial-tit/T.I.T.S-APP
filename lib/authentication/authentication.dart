import 'package:carousel_slider/carousel_slider.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tits_cs_department/authentication/student_card.dart';
import 'package:tits_cs_department/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/custom_text_field.dart';
import 'email_otp.dart';
import 'authentication_controller.dart';

class AuthenticationScreen extends StatelessWidget {
  final controller = Get.put(AuthenticationController());
  AuthenticationScreen({Key? key}) : super(key: key);
  
  final GlobalKey<FormState> _teachersFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cardList = [
      StudentCard(),
      Center(
        child: VxGlassmorphic(
                opacity: 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: "Faculty".text.xl4.bold.white.make().shimmer(
                      primaryColor: Vx.warmGray100,
                      secondaryColor: Colors.purple),)),
      )
    ];
    final RxInt selected_slider = 0.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
      ),
    );
  }
}
