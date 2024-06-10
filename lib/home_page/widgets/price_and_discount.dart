import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceAndDiscount extends StatelessWidget {
  final double originalPrice;
  final double discountedPrice;
  final int discount;

  const PriceAndDiscount({
    Key? key,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (discount > 0) ...[
          Text(
            '$discountedPrice',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "Figtree",
              color: Colors.red,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            '$originalPrice',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Figtree",
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ] else ...[
          Text(
            '$originalPrice',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "Figtree",
            ),
          ),
        ],
        SizedBox(width: 8.w),
      ],
    );
  }
}
