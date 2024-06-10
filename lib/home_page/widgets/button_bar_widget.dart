import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/model_buton_sheet.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/custom_card_button.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/model_button_sheet_filter.dart';

class ButtonBarWidget extends StatelessWidget {
  
  const ButtonBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomCardButton(
            onTap: () {
              showSortModalBottomSheet(context);
            },
            imgData: "assets/images/arrows_down.png",
            text: "Sort",
          ),
          CustomCardButton(
            onTap: () {
              showFilterModalBottomSheet(context);
            },
            imgData: "assets/images/funnel.png",
            text: "Filter",
          ),
        ],
      ),
    );
  }
}
