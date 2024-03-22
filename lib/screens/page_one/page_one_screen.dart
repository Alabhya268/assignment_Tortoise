import 'package:assignment/screens/page_two/page_two_screen.dart';
import 'package:assignment/utils/app_extensions.dart';
import 'package:assignment/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  height: 32,
                  width: 32,
                  context.svgPath.creditCard,
                ),
                Text(
                  "Flexi-benefits card",
                  textAlign: TextAlign.center,
                  style: context.constantUi.textStlHaffer(
                    fontSize: context.constantUi.textSizeLargeTwo,
                    fontWeight: context.constantUi.fontWeightBold,
                    color: context.constantUi.colorBlackButton,
                  ),
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    style: context.constantUi.textStlInter(),
                    text:
                        "Allocate a part of your salary against tax-saving allowances and access them with a Rupay card that is ",
                  ),
                  TextSpan(
                    style: context.constantUi.textStlInter(
                      fontWeight: context.constantUi.fontWeightBold,
                      color: context.constantUi.colorBlackButton,
                    ),
                    text: "accepted online ",
                  ),
                  TextSpan(
                    style: context.constantUi.textStlInter(),
                    text: "and ",
                  ),
                  TextSpan(
                    style: context.constantUi.textStlInter(
                      fontWeight: context.constantUi.fontWeightBold,
                      color: context.constantUi.colorBlackButton,
                    ),
                    text: "across 5 lakh merchants",
                  ),
                ],
              ),
            ),
            Image.asset(
              context.imgPath.cardOne,
              width: double.maxFinite,
            ),
            SizedBox(
              height: 132,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageTwoScreen(),
                        ),
                      );
                    },
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Explore flexi-benefits",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: context.constantUi.textStlInter(
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
                  CustomButton(
                    width: double.maxFinite,
                    color: context.constantUi.colorWhite,
                    child: Center(
                      child: Text(
                        "Setup later",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: context.constantUi.textStlInter(
                          fontWeight: context.constantUi.fontWeightBold,
                          color: context.constantUi.colorBlackButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
