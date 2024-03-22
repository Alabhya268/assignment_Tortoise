import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlexiCardWidget extends StatelessWidget {
  const FlexiCardWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 145,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: data["bgcolor"],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(data["svg"]),
                  const SizedBox(height: 10),
                  Text(
                    data["name"],
                    style: context.constantUi.textStlHaffer(
                      fontSize: context.constantUi.textSizeLargeOne,
                      fontWeight: context.constantUi.fontWeightBold,
                      color: data["tcolor"],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SvgPicture.asset(context.svgPath.divider),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data["text"],
                        style: context.constantUi.textStlInter(
                          fontSize: context.constantUi.textSizeSmallOne,
                          fontWeight: context.constantUi.fontWeightBold,
                          color: context.constantUi.colorBlackButton,
                        ),
                      ),
                      SvgPicture.asset(context.svgPath.caretCircleRight),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(data["trsvg"]),
            ),
          ],
        ),
      ),
    );
  }
}
