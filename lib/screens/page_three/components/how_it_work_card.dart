import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';

class HowItWorkCard extends StatelessWidget {
  const HowItWorkCard({
    super.key,
    required this.child,
    this.height,
    this.width,
  });

  final Widget child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 95,
      width: width ?? 165,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: context.constantUi.colorBorderGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
