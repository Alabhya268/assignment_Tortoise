import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({
    super.key,
    required this.faq,
  });

  final List<String> faq;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      itemCount: faq.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final curItem = faq[index];
        return _faqCard(context, curItem);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }

  Container _faqCard(BuildContext context, String curItem) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        border: Border.all(
          width: 1,
          color: context.constantUi.colorBorderGrey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              context.svgPath.dropDown,
              height: 24,
              width: 24,
            ),
          ),
          Expanded(
            flex: 12,
            child: Text(
              curItem,
              style: context.constantUi.textStlInter(
                color: context.constantUi.colorBlackButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
