import 'package:assignment/screens/page_three/page_three_screen.dart';
import 'package:assignment/utils/app_extensions.dart';
import 'package:assignment/widget/custom_button.dart';
import 'package:assignment/widget/custom_fillbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PgTwoBttmBr extends StatelessWidget {
  const PgTwoBttmBr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 170,
      decoration: BoxDecoration(
        color: context.constantUi.colorWhite,
        border: Border.all(
          color: context.constantUi.colorBorderGrey,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ 0 allocated",
                style: context.constantUi.textStlInter(
                  fontWeight: context.constantUi.fontWeightBold,
                  color: context.constantUi.colorBlackButton,
                ),
              ),
              Text(
                "₹ 10,000 available",
                style: context.constantUi.textStlInter(
                  fontWeight: context.constantUi.fontWeightLight,
                ),
              ),
            ],
          ),
          CustomFillBar(
            width: 350,
            height: 7,
            fillPercentage: 2,
            borderRadius: 4,
            fillColor: const Color(0xff42D499),
            backgroundColor: context.constantUi.colorBorderGrey,
            isDragable: false,
          ),
          CustomButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageThreeScreen(),
              ),
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: context.constantUi.textStlHaffer(
                    fontWeight: context.constantUi.fontWeightBold,
                    color: context.constantUi.colorWhite,
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  context.svgPath.arrowCircleRight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
