import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_shop/services/constants/colors.dart';
import 'package:plants_shop/services/constants/strings.dart';

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              alignment: Alignment.center,
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: const Text(
                  CustomStrings.thanks,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 65.h,
        width: 45.w,
        decoration: BoxDecoration(
          color: CustomColors.white,
          border: Border.all(
            color: CustomColors.deviderColor,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 5,
            ),
            Container(
              color: CustomColors.deviderColor,
              height: 2.h,
              width: 25.w,
            ),
            const Spacer(),
            Container(
              color: CustomColors.deviderColor,
              height: 2.h,
              width: 15.w,
            ),
            const Spacer(),
            Container(
              color: CustomColors.deviderColor,
              height: 2.h,
              width: 25.w,
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
