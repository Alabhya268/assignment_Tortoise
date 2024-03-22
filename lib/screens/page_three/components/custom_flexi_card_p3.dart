import 'package:assignment/utils/app_extensions.dart';
import 'package:assignment/widget/flexi_card_widget.dart';
import 'package:flutter/material.dart';

class CustomFlexiCardP3 extends StatelessWidget {
  const CustomFlexiCardP3({
    super.key,
    required this.cardData,
  });

  final Map<String, dynamic> cardData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 7,
            spreadRadius: 0,
            color: context.constantUi.colorBlack.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(0, 13),
            blurRadius: 13,
            spreadRadius: 0,
            color: context.constantUi.colorBlack.withOpacity(0.09),
          ),
          BoxShadow(
            offset: const Offset(0, 30),
            blurRadius: 18,
            spreadRadius: 0,
            color: context.constantUi.colorBlack.withOpacity(0.05),
          ),
          BoxShadow(
            offset: const Offset(0, 53),
            blurRadius: 21,
            spreadRadius: 0,
            color: context.constantUi.colorBlack.withOpacity(0.01),
          ),
        ],
      ),
      child: FlexiCardWidget(data: cardData),
    );
  }
}
