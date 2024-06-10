import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mami_onesignal_flutter/home_page/bloc/home_bloc.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/basket_button.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/discount_and_rating.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/price_and_discount.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/product_image.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/products_info.dart';
import 'package:mami_onesignal_flutter/service/ecommerce_api_model.dart';
class CustomCard extends StatefulWidget {
  final EcommerceApimodel item;
  final int index;
  final int? discount;
  final double? rating;
  final bool isSelected;

  const CustomCard({
    Key? key,
    required this.item,
    required this.index,
    required this.discount,
    required this.isSelected,
    this.rating,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final product = state.ecommerceList[widget.index];
        final discount = product.discount ?? 0;
        final originalPrice = product.price ?? 0.0;
        final discountedPrice =
            originalPrice - (originalPrice * discount / 100);
        final isFavorite = state.favoriteProducts?.any((p) => p.name == widget.item.name) ?? false;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(color: const Color(0xFFE5E5EA), width: 1),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(imageUrl: widget.item.imgUrl),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(FavoriteButtonTappedEvent(widget.item));
                        },
                        icon: Image.asset(
                          isFavorite
                              ? "assets/images/is_select.png"
                              : "assets/images/is_not_select.png",
                          height: 32.h,
                          width: 32.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(
                      brand: product.brand ?? "",
                      name: widget.item.name ?? "",
                    ),
                    PriceAndDiscount(
                      originalPrice: originalPrice,
                      discountedPrice: discountedPrice,
                      discount: discount,
                    ),
                    DiscountAndRatingRow(
                      discount: discount,
                      rating: product.rating,
                    ),
                    SizedBox(height: 6.h),
                    BasketButton(
                        item: widget.item, isSelected: widget.isSelected),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
