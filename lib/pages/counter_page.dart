import 'package:flutter/material.dart';
import 'package:plants_shop/models/plant.dart';
import 'package:plants_shop/provider/provider_inherit.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key, required this.model}) : super(key: key);
  final PlantModel model;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
            listenable: cartController,
            builder: (context, _) {
              return Stack(
                children: [
                  Container(
                    color: const Color(0xFFDCEBFE),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 30),
                                  text: "The Potted ",
                                  children: [
                                    TextSpan(
                                        text: 'Head',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800))
                                  ]),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 65,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.green.shade800,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  const Spacer(
                                    flex: 5,
                                  ),
                                  Container(
                                    color: Colors.green.shade800,
                                    height: 2,
                                    width: 25,
                                  ),
                                  const Spacer(),
                                  Container(
                                    color: Colors.green.shade800,
                                    height: 2,
                                    width: 15,
                                  ),
                                  const Spacer(),
                                  Container(
                                    color: Colors.green.shade800,
                                    height: 2,
                                    width: 25,
                                  ),
                                  const Spacer(
                                    flex: 5,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Text(
                          "Plants",
                          style: TextStyle(
                              fontSize: 148,
                              color: Colors.greenAccent.withOpacity(0.3),
                              letterSpacing: -10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 170,
                      width: 170,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 52),
                    child: Column(
                      children: [
                        Image.asset("assets/images/img8-removebg-preview.png"),
                        const Text(
                          "Perfect from beginners or anyone looking\n"
                          "for an easy- to- care-for plant",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          cartController.cart.items
                                  .where((element) =>
                                      element.plantModel == widget.model)
                                  .isNotEmpty
                              ? cartController.cart.items
                                  .firstWhere((element) =>
                                      element.plantModel == widget.model)
                                  .quantity
                                  .toString()
                                  .padLeft(2, "0")
                              : "00",
                          style: const TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 540),
                    child: ClipPath(
                      clipper: MyClip(),
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 5,
                        color: const Color(0xFFDCEBFE),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 25, bottom: 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartController.addToCard(
                                      product: widget.model, quantity: -1);
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  size: 55,
                                  color: Colors.black87,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartController.addToCard(
                                      product: widget.model, quantity: 1);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 55,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 700, 25, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " Add to Cart",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                "\$50.00",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final x = size.width;
    final y = size.height;
    Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(x / 2, y / 5, 0, y)
      ..close()
      ..moveTo(x, y)
      ..quadraticBezierTo(x / 2, y / 5, x, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
