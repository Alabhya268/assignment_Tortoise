import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';

class PgTwoTopSection extends StatelessWidget {
  const PgTwoTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Flexi-benefits",
          textAlign: TextAlign.center,
          style: context.constantUi.textStlInter(
            fontSize: context.constantUi.textSizeLargeTwo,
            fontWeight: context.constantUi.fontWeightBold,
            color: context.constantUi.colorBlackButton,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Explore various tax-saving allowances available to you and opt for those that make the most sense for you",
          textAlign: TextAlign.center,
          style: context.constantUi.textStlInter(),
        ),
      ],
    );
  }
}
