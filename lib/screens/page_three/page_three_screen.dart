import 'package:assignment/screens/page_three/components/faq_widget.dart';
import 'package:assignment/screens/page_three/components/full_allowance_section.dart';
import 'package:assignment/screens/page_three/components/how_it_work_card.dart';
import 'package:assignment/screens/page_three/components/pg_three_bttm_btn.dart';
import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageThreeScreen extends StatefulWidget {
  const PageThreeScreen({super.key});

  @override
  State<PageThreeScreen> createState() => _PageThreeScreenState();
}

class _PageThreeScreenState extends State<PageThreeScreen> {
  Map<String, dynamic> get cardData => {
        "svg": context.svgPath.fuel,
        "name": "Fuel Allowance",
        "text": "Allocate upto ₹ 2400 / month",
        "tcolor": const Color(0xff80121D),
        "bgcolor": context.constantUi.colorOrangeAccent,
        "bcolor": context.constantUi.colorBlackButton,
        "trsvg": context.svgPath.cardDecOne,
      };

  List<String> get faq => [
        "What happens to my unused balance at the end off the month?",
        "Can I opt out of this allowance later?",
        "Do all fuel stations accept the physical card?",
      ];

  int curAmt = 1300;
  int maxAmt = 2400;
  int minAmt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.constantUi.colorWhite,
      appBar: AppBar(
        backgroundColor: context.constantUi.colorWhite,
        shadowColor: context.constantUi.colorBorderGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              context.svgPath.caretCircleLeft,
              height: 32,
              width: 32,
            ),
          ),
        ),
        title: Text(
          "Flexi-benefits",
          style: context.constantUi.textStlHaffer(
            fontWeight: context.constantUi.fontWeightBold,
            fontSize: context.constantUi.textSizeMedTwo,
            color: context.constantUi.colorBlackButton,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          FullAllowanceSection(cardData: cardData),
          _benefitSection(context),
          _customDivider(context),
          _howItWorkSection(context),
          _customDivider(context),
          _faqSection(context),
          const PgThreeBttmBtn()
        ],
      ),
    );
  }

  Column _faqSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        _customTitle(context,
            svg: context.svgPath.faq, text: "Frequently asked questions"),
        FaqWidget(faq: faq),
      ],
    );
  }

  Container _howItWorkSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customTitle(context,
              svg: context.svgPath.howItWorks, text: "How does it work?"),
          const SizedBox(height: 15),
          Text(
            "This allowance can be used via 2 modes",
            style: context.constantUi.textStlInter(),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HowItWorkCard(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(context.svgPath.cCard),
                      Text(
                        "Physical Card",
                        style: context.constantUi.textStlInter(
                          fontWeight: context.constantUi.fontWeightBold,
                          color: context.constantUi.colorBlackButton,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              HowItWorkCard(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(context.svgPath.reimbursement),
                      Text(
                        "Reimbursement",
                        style: context.constantUi.textStlInter(
                          fontWeight: context.constantUi.fontWeightBold,
                          color: context.constantUi.colorBlackButton,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "You can pay using the issued physical card directly at fuel stations. Incase you are unable to use the card, you can upload a receipt on the app and receive an instant reimbursement",
            style: context.constantUi.textStlInter(),
          ),
        ],
      ),
    );
  }

  Container _benefitSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          _customTitle(context, svg: context.svgPath.benefit, text: "Benefits"),
          const SizedBox(height: 15),
          Text(
            "If you travel to work by your own two-wheeler or car, you can use this allowance for purchase of fuel for the vehicle.",
            style: context.constantUi.textStlInter(),
          ),
        ],
      ),
    );
  }

  Row _customTitle(BuildContext context,
      {required String svg, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(svg),
        const SizedBox(width: 15),
        Text(
          text,
          style: context.constantUi.textStlHaffer(
            fontSize: context.constantUi.textSizeMedOne,
            fontWeight: context.constantUi.fontWeightBold,
            color: context.constantUi.colorBlackButton,
          ),
        )
      ],
    );
  }

  SvgPicture _customDivider(BuildContext context) {
    return SvgPicture.asset(
      context.svgPath.dividerLight,
      fit: BoxFit.fitWidth,
    );
  }
}
