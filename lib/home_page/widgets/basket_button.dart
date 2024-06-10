import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mami_onesignal_flutter/home_page/bloc/home_bloc.dart';
import 'package:mami_onesignal_flutter/service/ecommerce_api_model.dart';

class BasketButton extends StatefulWidget {
  final EcommerceApimodel item;
  final bool isSelected;

  const BasketButton({super.key, required this.item, required this.isSelected});

  @override
  _BasketButtonState createState() => _BasketButtonState();
}

class _BasketButtonState extends State<BasketButton> {
  void _handleTap() {
    context.read<HomeBloc>().add(BasketButtonTappedEvent(widget.item));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      child: Container(
        height: 32.h,
        width: 153.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            width: 1,
            color: const Color(0xFFE5E5EA),
          ),
          color: widget.isSelected ? Colors.grey : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.isSelected
                  ? "assets/images/check_circle.png"
                  : "assets/images/basket_icon.png",
              height: 17.h,
              width: 17.w,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 7.w),
            Text(
              widget.isSelected ? "Added to cart" : "Add to cart",
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
