import 'package:flutter/material.dart';
import 'package:plants_shop/services/constants/colors.dart';

class SelectType extends StatelessWidget {
  void Function() function;
  int selected;
  int index;
  String type;

  SelectType(
      {super.key,
      required this.index,
      required this.type,
      required this.selected,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 85,
        decoration: BoxDecoration(
            color: index == selected ? CustomColors.green : CustomColors.white,
            borderRadius: BorderRadius.circular(22.5)),
        child: Text(type),
      ),
    );
  }
}
