import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final Widget child;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    this.color,
    this.height,
    this.width,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 62,
        width: width,
        decoration: BoxDecoration(
          color: color ?? context.constantUi.colorBlackButton,
          borderRadius: BorderRadius.circular(31),
        ),
        child: child,
      ),
    );
  }
}
