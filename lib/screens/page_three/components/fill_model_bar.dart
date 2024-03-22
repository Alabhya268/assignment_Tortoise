import 'package:assignment/utils/app_extensions.dart';
import 'package:assignment/widget/custom_button.dart';
import 'package:assignment/widget/custom_fillbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FillModelBar extends StatefulWidget {
  const FillModelBar({
    super.key,
    this.minAmt = 0,
    this.maxAmt = 2400,
    this.curAmt = 1300,
  });

  final int minAmt;
  final int maxAmt;
  final int curAmt;

  @override
  State<FillModelBar> createState() => _FillModelBarState();
}

class _FillModelBarState extends State<FillModelBar> {
  late ValueNotifier<int> curAmt;
  late int minAmt;
  late int maxAmt;

  @override
  void initState() {
    super.initState();
    minAmt = widget.minAmt;
    maxAmt = widget.maxAmt;
    curAmt = ValueNotifier(widget.curAmt);
  }

  @override
  void dispose() {
    curAmt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Container(
              height: 660,
              padding: const EdgeInsets.only(top: 70),
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 590,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: context.constantUi.colorWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                child: Column(
                  children: [
                    _draghandle(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Setting allowance amount".toUpperCase(),
                            style: context.constantUi.textStlHaffer(
                              fontSize: context.constantUi.textSizeSmallOne,
                              fontWeight: context.constantUi.fontWeightBold,
                              color: const Color(0xffCBCBCB),
                            ),
                          ),
                          _midSection(context),
                          _amoutScroller(),
                          _bottomButton(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _maxOutChip(),
          ],
        ),
      ),
    );
  }

  ValueListenableBuilder<int> _maxOutChip() {
    return ValueListenableBuilder(
      valueListenable: curAmt,
      builder: (context, val, child) => val == maxAmt
          ? Positioned(
              top: 10,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  height: 42,
                  width: 128,
                  decoration: BoxDecoration(
                    color: context.constantUi.colorWhite,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Text(
                      "Maxed out 👏",
                      style: context.constantUi.textStlInter(
                        fontSize: context.constantUi.textSizeSmallOne,
                        color: context.constantUi.colorBlackButton,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  CustomButton _bottomButton(BuildContext context) {
    return CustomButton(
      onTap: () => Navigator.pop(context),
      child: Center(
        child: Text(
          "Done",
          style: context.constantUi.textStlInter(
            color: context.constantUi.colorWhite,
            fontWeight: context.constantUi.fontWeightBold,
          ),
        ),
      ),
    );
  }

  ValueListenableBuilder<int> _amoutScroller() {
    return ValueListenableBuilder(
      valueListenable: curAmt,
      builder: (context, val, index) => Column(
        children: [
          Text(
            "₹ $val",
            style: context.constantUi.textStlInter(
              fontSize: context.constantUi.textSizeLargeThree,
              fontWeight: context.constantUi.fontWeightBold,
              color: context.constantUi.colorBlackButton,
            ),
          ),
          const SizedBox(height: 30),
          CustomFillBar(
            fillColor: val == maxAmt
                ? const Color(0xff62E29F)
                : context.constantUi.colorOrangeAccent,
            backgroundColor: context.constantUi.colorBorderGrey,
            borderRadius: 12,
            height: 70,
            width: 350,
            fillPercentage: (curAmt.value / maxAmt) * 100,
            isDragable: true,
            minBarWidth: 15,
            callbackAction: (fill) {
              double minFilP = 0.043;
              double totalFill = 1 - minFilP;
              double amt = ((fill - minFilP) / (totalFill)) * maxAmt;
              curAmt.value = amt.round();
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ 0",
                style: context.constantUi.textStlInter(
                  fontSize: context.constantUi.textSizeSmallOne + 1,
                ),
              ),
              Text(
                "₹ $maxAmt",
                style: context.constantUi.textStlInter(
                  fontSize: context.constantUi.textSizeSmallOne + 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _midSection(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          context.svgPath.fuel,
          height: 24,
          width: 24,
          color: context.constantUi.colorOrangeAccent,
        ),
        const SizedBox(height: 15),
        Text(
          "Fuel Allowance",
          style: context.constantUi.textStlHaffer(
            fontSize: context.constantUi.textSizeLargeOne,
            fontWeight: context.constantUi.fontWeightBold,
            color: context.constantUi.colorBlackButton,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                style: context.constantUi.textStlInter(),
                text: "Drag the bar to set the desired ",
              ),
              TextSpan(
                style: context.constantUi.textStlInter(
                  color: const Color(0xff323232),
                ),
                text: "monthly amount ",
              ),
              TextSpan(
                style: context.constantUi.textStlInter(),
                text: "and ",
              ),
              TextSpan(
                style: context.constantUi.textStlInter(),
                text: "for this allowance",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _draghandle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: 90,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
        color: context.constantUi.colorBorderGrey,
      ),
      padding: const EdgeInsets.all(20),
    );
  }
}
