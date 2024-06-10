import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingImageWidget extends StatelessWidget {
  const OnboardingImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.grey.shade300,
              ],
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: 50.h),
          child: Container(
            height: 375.h,
            width: 375.w,
            decoration: const BoxDecoration(),
            child: Image.asset(
              "assets/images/welcome_images.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
