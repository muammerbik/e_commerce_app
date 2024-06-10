import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountAndRatingRow extends StatelessWidget {
  final int discount;
  final double? rating;

  const DiscountAndRatingRow({
    Key? key,
    required this.discount,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (discount > 0)
          Text(
            '$discount% indirim',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Figtree",
              color: Colors.red,
            ),
          ),
        SizedBox(height: 5.h),
        if (rating != null) ...[
          Row(
            children: [
              Text(
                '$rating',
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Figtree",
                ),
              ),
              Icon(
                Icons.star,
                size: 15.sp,
                color: Colors.orange.shade700,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
