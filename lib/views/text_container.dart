import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_shop/services/constants/colors.dart';

class TextContainer extends StatelessWidget {
  final TextEditingController controller;
  final String name;

  const TextContainer(
      {super.key, required this.controller, required this.name});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              bottomRight: Radius.circular(50.r)),
          border: Border.all(color: CustomColors.teal, width: 3)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: name,
            hintStyle: TextStyle(fontSize: 14.w),
            border: InputBorder.none),
      ),
    );
  }
}
