import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? text;
  final String? imgData;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Widget? customChild;

  const CustomCardButton({
    Key? key,
    this.height,
    this.width,
    this.text,
    this.imgData,
    this.onTap,
    this.textStyle,
    this.borderRadius,
    this.customChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 45.h,
        width: width ?? 160.w,
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: const Color(0xFFE5E5EA)),
          color: Colors.white,
        ),
        child: customChild ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgData!,
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  text!,
                  style: TextStyle(
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    height: 1.2,
                    letterSpacing: 0.16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
      ),
    );
  }
}
