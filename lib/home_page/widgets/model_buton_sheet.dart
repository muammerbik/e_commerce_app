import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mami_onesignal_flutter/home_page/bloc/home_bloc.dart';

void showSortModalBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 250.h,
        decoration: const BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sort",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close, size: 17.sp),
                  )
                ],
              ),
              const Divider(),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      context
                          .read<HomeBloc>()
                          .add(const AscendingSortbyPriceActivity());
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Lowest price",
                      style: TextStyle(fontSize: 17.sp),
                    )),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const AccordingtoPriceDescendingSorting());
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "highest price",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const RatingGoreDescendingRankEvent());
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Most reviewed",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const DiscountByDescendingSortingEvent());
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Opportunity products",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      );
    },
  );
}
