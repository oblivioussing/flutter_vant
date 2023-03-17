import 'package:flutter/material.dart';

import '/style/color.dart';

class VanBorder {
  static const _color = VanColor.gray3;
  static const double _width = 1;

  static BorderSide side({Color? color, double? width}) {
    color ??= _color;
    width ??= _width;
    return BorderSide(
      color: color,
      width: width,
    );
  }

  // 圆角
  static BorderRadius radius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }

  // 全边框
  static Border all({color = _color, width = _width}) {
    return Border.all(color: color, width: width);
  }

  // 左边框
  static Border left({Color? color, double? width}) {
    return Border(
      left: side(color: color, width: width),
    );
  }

  // 上边框
  static Border top({Color? color, double? width}) {
    return Border(
      top: side(color: color, width: width),
    );
  }

  // 右边框
  static Border right({Color? color, double? width}) {
    return Border(
      right: side(color: color, width: width),
    );
  }

  // 下边框
  static Border bottom({Color? color, double? width}) {
    return Border(
      bottom: side(color: color, width: width),
    );
  }
}
