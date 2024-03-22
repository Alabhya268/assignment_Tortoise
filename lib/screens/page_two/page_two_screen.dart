import 'package:assignment/screens/page_two/component/pg_two_top_section.dart';
import 'package:assignment/screens/page_two/component/pg_two_bttm_br.dart';
import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'component/flexi_list.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cardData = [
      {
        "svg": context.svgPath.fuel,
        "name": "Fuel Allowance",
        "text": "Allocate upto ₹ 2400 / month",
        "tcolor": const Color(0xff80121D),
        "bgcolor": context.constantUi.colorOrangeAccent,
        "bcolor": context.constantUi.colorBlackButton,
        "trsvg": context.svgPath.cardDecOne,
      },
      {
        "svg": context.svgPath.meal,
        "name": "Meal Card",
        "text": "Allocate upto ₹ 2400 / month",
        "tcolor": const Color(0xff114036),
        "bgcolor": const Color(0xff83EDA8),
        "bcolor": context.constantUi.colorBlackButton,
        "trsvg": context.svgPath.cardDecTwo,
      },
      {
        "svg": context.svgPath.vehicle,
        "name": "Commute Allowance",
        "text": "Allocate upto ₹ 2400 / month",
        "tcolor": const Color(0xff5C3A12),
        "bgcolor": const Color(0xffFEC858),
        "bcolor": context.constantUi.colorBlackButton,
        "trsvg": context.svgPath.cardDecThree,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      ),
      bottomNavigationBar: const PgTwoBttmBr(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const PgTwoTopSection(),
          const SizedBox(height: 30),
          FlexiList(cardData: cardData),
        ],
      ),
    );
  }
}
