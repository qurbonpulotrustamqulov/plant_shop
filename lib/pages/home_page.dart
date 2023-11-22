import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:plants_shop/models/plant.dart';
import 'package:plants_shop/pages/cart_page.dart';
import 'package:plants_shop/pages/counter_page.dart';
import 'package:plants_shop/provider/provider_inherit.dart';
import 'package:plants_shop/services/constants/colors.dart';
import 'package:plants_shop/services/constants/icons.dart';
import 'package:plants_shop/services/constants/strings.dart';
import 'package:plants_shop/views/bottom_sheet.dart';
import 'package:plants_shop/views/devider_container.dart';
import 'package:plants_shop/views/select_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> types = [
    CustomStrings.plants,
    CustomStrings.flowers,
    CustomStrings.cacti,
    CustomStrings.herbs,
    CustomStrings.boxibon,
  ];
  int selected = 0;

  List freeList = plantModels;

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: CustomColors.black, fontSize: 30),
                            text: CustomStrings.letsMake,
                            children: [
                              TextSpan(
                                  text: CustomStrings.greener,
                                  style: TextStyle(fontWeight: FontWeight.w800))
                            ]),
                      ),
                      const DrawerContainer()
                    ],
                  ),
                  const SizedBox(height: 25),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < types.length; i++)
                          SelectType(
                            index: i,
                            type: types[i],
                            selected: selected,
                            function: () {
                              selected = i;
                              if (types[i] != CustomStrings.plants) {
                                freeList = [
                                  for (int g = 0; g < plantModels.length; g++)
                                    if (plantModels[g]
                                            .type
                                            .name
                                            .toLowerCase() ==
                                        types[i].toLowerCase())
                                      plantModels[g]
                                ];
                              } else {
                                freeList = plantModels;
                              }
                              setState(() {});
                            },
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        CustomStrings.collection,
                        style: TextStyle(fontSize: 25),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage(),));
                          },
                          icon: CustomIcons.forward)
                    ],
                  ),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.51,
                      width: MediaQuery.of(context).size.width * 0.71,
                      child: CarouselSlider(
                        clipBehavior: Clip.antiAlias,
                        slideTransform: const CubeTransform(),
                        unlimitedMode: false,
                        children: [
                          for (int i = 0; i < freeList.length; i++)
                            Container(
                              margin: const EdgeInsets.all(2),
                              alignment: Alignment.center,
                              height:
                                  MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(22.5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: CustomColors.grey,
                                        blurRadius: 8)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.6,
                                    decoration: BoxDecoration(
                                      color: CustomColors.greyLight,
                                      borderRadius:
                                          BorderRadius.circular(22.5),
                                    ),
                                    child: Image.asset(freeList[i].imageUrl,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.25),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      freeList[i].name,
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    freeList[i].description,
                                    textAlign: TextAlign.center,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cartController.addToCard(
                                          product: freeList[i], quantity: 1);
                                    },
                                    onLongPress: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage(model: freeList[i]),));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.6,
                                      decoration: BoxDecoration(
                                        color: CustomColors.black87,
                                        borderRadius:
                                            BorderRadius.circular(45),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              CustomStrings.addToCart,
                                              style: TextStyle(
                                                  color: CustomColors.white,
                                                  fontSize: 18),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "\$${freeList[i].price.toString().length > 3 ? freeList[i].price.toString().substring(0, 3) : freeList[i].price}",
                                              style: const TextStyle(
                                                  color: CustomColors.white,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomSheetCustom(cartController: cartController)
          ],
        ),
      )),
    );
  }
}
