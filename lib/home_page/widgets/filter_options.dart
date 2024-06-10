
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterOption extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const FilterOption({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15.h,
          )
        ],
      ),
    );
  }
}
