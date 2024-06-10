import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingTextWidget extends StatelessWidget {
  const OnboardingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          "Get Started Now!",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Thank you for downloading our application\n. We will continue to do better for you",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF8E8E8E)),
        ),
      ],
    );
  }
}
