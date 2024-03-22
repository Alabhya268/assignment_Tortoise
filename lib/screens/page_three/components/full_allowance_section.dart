import 'package:assignment/screens/page_three/components/custom_flexi_card_p3.dart';
import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';

class FullAllowanceSection extends StatelessWidget {
  const FullAllowanceSection({
    super.key,
    required this.cardData,
  });

  final Map<String, dynamic> cardData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFlexiCardP3(cardData: cardData),
        const SizedBox(height: 20),
        Text(
          "Fuel allowance helps cover your vehicle's fuel expenses, making commutes and travel more affordable",
          style: context.constantUi.textStlInter(),
        ),
      ],
    );
  }
}
