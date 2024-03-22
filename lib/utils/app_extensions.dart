import 'package:assignment/core/asset_image_icon_keys.dart';
import 'package:assignment/core/asset_svg_icon_keys.dart';
import 'package:assignment/core/constant_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextHelper on BuildContext {
  MediaQueryData get appMediaQuery => MediaQuery.of(this);
  Size get mediaSize => appMediaQuery.size;
  double get mediaWidth => mediaSize.width;
  double get mediaHeight => mediaSize.height;

  AssetImageKeys get imgPath => AssetImageKeys();
  AssetSvgIconKeys get svgPath => AssetSvgIconKeys();

  ConstantUi get constantUi => ConstantUi();
}

extension ColorExtension on String {
  Color? toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }

    return null;
  }

  String pluralS(num? value) {
    if (value == null || value == 1) return this;
    return "${this}s";
  }
}
