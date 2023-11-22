import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plants_shop/provider/provider_inherit.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: cartController,
          builder: (context,_) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cart",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.greenAccent),
                          child:  Text(
                              cartController.cart.items.length.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26, overflow: TextOverflow.fade),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        color: Colors.blueGrey.shade300.withOpacity(0.05),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 45, left: 25, right: 25, bottom: 25),
                          child: SizedBox(
                            height: 600,
                            width: double.infinity,
                            child: ListView(
                              children: [
                                for(int i = 0; i< cartController.cart.items.length;i++
                                )
                                Column(mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    const Color(0xFFDCEBFE),
                                                    const Color.fromARGB(
                                                      0,
                                                      220,
                                                      235,
                                                      254,
                                                    ).withOpacity(0.04)
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter),
                                              borderRadius: BorderRadius.circular(180)),
                                          child:
                                              Image.asset(cartController.cart.items[i].plantModel.imageUrl),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                               Text(
                                                cartController.cart.items[i].plantModel.name,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                "${cartController.cart.items[i].quantity} piece",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.green.shade900),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 90,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(45),
                                            color: Colors.white,
                                          ),
                                          child:  Text(
                                            "\$${cartController.cart.items[i].plantModel.price}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                                SizedBox(height:MediaQuery.of(context).size.height / 3.5,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: MyClipper2(),
                      child: Container(
                        color: Colors.greenAccent,
                        height:
                        MediaQuery.of(context).size.height / 3.5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Amount",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "\$25.50",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                               Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    (cartController.cart.total + 25.50).toString(),
                                    style: const TextStyle(
                                      overflow: TextOverflow.fade,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.fromLTRB(
                                    17, 5, 5, 5),
                                height: 50,
                                decoration: BoxDecoration(
                                    color:
                                    Colors.white.withOpacity(0.4),
                                    borderRadius:
                                    BorderRadius.circular(45),
                                    border: Border.all(
                                        color: Colors.green.shade900)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Make Payment",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 45,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(45),
                                          color:
                                          Colors.blueGrey.shade900),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white
                                                .withOpacity(0.3),
                                            size: 18,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white
                                                .withOpacity(0.5),
                                            size: 18,
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )

                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 45;
    final x = size.width;
    final y = size.height;
    Path path = Path()
      ..moveTo(x, radius)
      ..lineTo(x, y)
      ..lineTo(0, y)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromCircle(center: Offset(radius, radius), radius: radius),
          pi, 0.5 * pi, true)
      ..lineTo(0.25 * x, 0)
      ..lineTo(0.38 * x, radius * 0.5)
      ..lineTo(0.63 * x, radius * 0.5)
      ..lineTo(0.75 * x, 0)
      ..lineTo(x - radius, 0)
      ..arcTo(
          Rect.fromCircle(center: Offset(x - radius, radius), radius: radius),
          1.5 * pi,
          0.5 * pi,
          false)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 45;
    double x = size.width;
    double y = size.height;
    Path path = Path()
      ..lineTo(x - radius / 4, 0)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(x - radius / 4, radius / 4), radius: radius / 4),
          1.5 * pi,
          0.5 * pi,
          true)
      ..lineTo(x, y - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(x - radius, y - radius), radius: radius),
          0,
          pi / 2,
          false)
      ..lineTo(radius, y)
      ..arcTo(
          Rect.fromCircle(center: Offset(radius, y - radius), radius: radius),
          pi / 2,
          0.5 * pi,
          true)
      ..lineTo(0, radius / 4)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(radius / 4, radius / 4), radius: radius / 4),
          pi,
          0.5 * pi,
          false)
      ..lineTo(x / 4, 0)
      ..lineTo(0.35 * x, radius * 0.8)
      ..lineTo(0.65 * x, radius * 0.8)
      ..lineTo(0.75 * x, 0)
      ..lineTo(x - radius / 4, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}

