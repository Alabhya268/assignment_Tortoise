import 'package:assignment/screens/page_three/components/fill_model_bar.dart';
import 'package:assignment/utils/app_extensions.dart';
import 'package:assignment/widget/custom_button.dart';
import 'package:flutter/material.dart';

class PgThreeBttmBtn extends StatelessWidget {
  const PgThreeBttmBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        showModalBottomSheet(
          elevation: 0,
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          builder: (context) => const FillModelBar(),
        );
      },
      child: Center(
        child: Text(
          "Select allowance amount",
          style: context.constantUi.textStlInter(
            fontWeight: context.constantUi.fontWeightBold,
            color: context.constantUi.colorWhite,
          ),
        ),
      ),
    );
  }
}
