import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plants_shop/controller/cart_controller.dart';
import 'package:plants_shop/services/constants/colors.dart';
import 'package:plants_shop/services/constants/strings.dart';

class BottomSheetCustom extends StatelessWidget {
  const BottomSheetCustom({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClip(),
      child: Container(
        alignment: Alignment.center,
        height: 120,
        decoration: const BoxDecoration(
            color: CustomColors.green,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35), topLeft: Radius.circular(35))),
        child: ListenableBuilder(
            listenable: cartController,
            builder: (context, _) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: CustomColors.white),
                        child: Text(
                          cartController.cart.items.length.toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          CustomStrings.cart,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${cartController.cart.items.length} items",
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      child: Stack(
                        children: [
                          for (int i = 0;
                              i < cartController.cart.items.length;
                              i++)
                            Container(
                              margin: const EdgeInsets.only(left: 75),
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(45),
                                  border: Border.all(
                                      color: CustomColors.green, width: 2)),
                              child: Image.asset(cartController
                                  .cart.items.last.plantModel.imageUrl),
                            ),
                          if (cartController.cart.items.length >= 2)
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(45),
                                  border: Border.all(
                                      color: CustomColors.green, width: 2)),
                              child: Image.asset(cartController
                                  .cart
                                  .items[cartController.cart.items.length - 2]
                                  .plantModel
                                  .imageUrl),
                            ),
                          if (cartController.cart.items.length >= 3)
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(45),
                                  border: Border.all(
                                      color: CustomColors.green, width: 2)),
                              child: Image.asset(cartController
                                  .cart
                                  .items[cartController.cart.items.length - 3]
                                  .plantModel
                                  .imageUrl),
                            ),
                          if (cartController.cart.items.length >= 4)
                            Container(
                              margin: const EdgeInsets.only(left: 0),
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(45),
                                  border: Border.all(
                                      color: CustomColors.green, width: 2)),
                              child: Image.asset(cartController
                                  .cart
                                  .items[cartController.cart.items.length - 4]
                                  .plantModel
                                  .imageUrl),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50;
    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, radius), radius: radius),
          1.5 * pi, // Start engle
          0.5 * pi, // Sweep engle
          true) // direction clockwise
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius, size.height)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(radius, size.height - radius), radius: radius),
          0.5 * pi,
          0.5 * pi,
          false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromCircle(center: Offset(radius, radius), radius: radius),
          1 * pi, 0.5 * pi, false)
      ..lineTo(size.width * 0.25, 0)
      ..lineTo(size.width * 0.35, radius * 0.35)
      ..addRect(Rect.fromLTWH(size.width * 0.43, 0, size.width * 0.15, 5))
      ..moveTo(size.width * 0.35, radius * 0.35)
      ..lineTo(size.width * 0.65, radius * 0.35)
      ..lineTo(0.75 * size.width, 0)
      ..lineTo(size.width - radius, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
