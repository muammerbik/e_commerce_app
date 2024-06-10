import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mami_onesignal_flutter/home_page/bloc/home_bloc.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/filter_options.dart';

void showFilterModalBottomSheet(
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
              const SizedBox(height: 10),
              Expanded(
                child: FilterOption(
                  title: "All products",
                  onTap: () {
                    context.read<HomeBloc>().add(const ShowAllProductsEvent());
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: FilterOption(
                  title: "Electronics",
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const FilterByCategoryEvent(category: "Electronics"));
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: FilterOption(
                  title: "Wearables",
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const FilterByCategoryEvent(category: "Wearables"));
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: FilterOption(
                  title: "Cameras",
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const FilterByCategoryEvent(category: "Cameras"));
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: FilterOption(
                  title: "Gaming",
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const FilterByCategoryEvent(category: "Gaming"));
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
