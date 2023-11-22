import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_shop/services/constants/colors.dart';
import 'package:plants_shop/services/constants/lotties.dart';
import 'package:plants_shop/services/constants/strings.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(CustomLotties.startPage),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 3,
                  color: CustomColors.teal,
                ),
              ),
              child: Text(
                CustomStrings.getStarted,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.w),
              ),
            )
          ],
        ),
      ),
    );
  }
}
