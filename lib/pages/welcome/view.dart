import 'package:firebase_chat/pages/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SizedBox(
        width: 360.w,
        height: 780.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (index) {
                controller.changePage(index);
              },
              controller: PageController(
                  initialPage: 0, keepPage: true, viewportFraction: 1),
              pageSnapping: true,
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner2.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner3.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        bottom: 90,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () => null,
                          child: Text("Login"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 70,
                child: DotsIndicator(
                  position: controller.state.index.value.toDouble(),
                  dotsCount: 3,
                  reversed: false,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
