import 'package:flutter/material.dart';

import '/scene/loading/loading.dart';
import '/style/color.dart';
import '/style/size.dart';
import '/widget/border.dart';

class VanButton extends StatefulWidget {
  VanButton({
    required this.onPressed,
    this.text = '',
    this.onLongPress,
    this.type = ButtonType.normal,
    this.size = ButtonSize.normal,
    this.height = VanButtonSize.normalHeight,
    this.width,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.borderRadius = VanBorderSize.borderRadiusSm,
    this.backgroundColor = VanColor.white,
    this.gradient,
    this.color,
    this.fontColor = VanColor.white,
    this.fontSize = VanFontSize.md,
    this.icon,
    this.plain = false,
    this.square = false,
    this.round = false,
    this.disabled = false,
    this.loading = false,
    this.loadingText = '',
    this.loadingType = LoadingType.circular,
    this.loadingSize = 20,
  });

  final String text; // 按钮文字
  final VoidCallback onPressed; // 点击回调
  final VoidCallback? onLongPress; // 长按回调
  final ButtonType type; // 类型
  final ButtonSize size; // 尺寸
  final double height; // 高度
  final double? width; // 宽度
  final MainAxisAlignment mainAxisAlignment; // 对齐方式
  final double borderRadius; // 圆角
  final Color backgroundColor; // 背景颜色
  final Gradient? gradient; // 渐变色
  final Color? color; // 按钮颜色
  final Color fontColor; // 文字颜色
  final double fontSize; // 文字大小
  final IconData? icon; // 左侧图标
  final bool plain; // 是否为朴素按钮
  final bool square; // 是否为方形按钮
  final bool round; // 是否为圆形按钮
  final bool disabled; // 是否禁用按钮
  final bool loading; // 是否显示为加载状态
  final String loadingText; // 加载状态提示文字
  final LoadingType loadingType; // 加载图标类型
  final double loadingSize; // 加载图标大小

  @override
  _VanButtonState createState() => _VanButtonState();
}

class _VanButtonState extends State<VanButton> {
  late Color backgroundColor; // 背景颜色
  late double borderRadius; // 圆角
  late Color color; // 颜色
  late Color fontColor; // 文字颜色
  late double fontSize; // 文字大小
  late BorderSide borderSide; // 边框
  late double? height; // 高度
  late double? width; // 宽度
  late double padding = VanPadding.buttonNormal; // 间距
  double iconSize = 20; // icon尺寸
  bool disabled = false; // 是否禁用点击

  @override
  Widget build(BuildContext context) {
    backgroundColor = widget.backgroundColor;
    borderRadius = widget.borderRadius;
    fontColor = widget.fontColor;
    fontSize = widget.fontSize;
    borderSide = BorderSide.none;
    height = widget.height;
    width = widget.width;
    // 初始化
    _init();

    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: _buttonStyle(),
        onPressed: disabled ? null : widget.onPressed,
        onLongPress: disabled ? null : widget.onLongPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
            gradient: widget.gradient,
          ),
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
          ),
          child: _button(),
        ),
      ),
    );
  }

  // 初始化
  _init() {
    var colorMap = {
      ButtonType.text: Colors.transparent,
      ButtonType.normal: VanColor.white,
      ButtonType.success: VanColor.success,
      ButtonType.warning: VanColor.warning,
      ButtonType.danger: VanColor.danger,
      ButtonType.primary: VanColor.primary,
    };
    // 颜色
    color = colorMap[widget.type] as Color;
    // 背景颜色
    if (widget.type == ButtonType.normal) {
      backgroundColor = widget.backgroundColor;
      // 如果背景色为白色,则字体为黑色
      if (backgroundColor == VanColor.white) {
        fontColor = VanColor.black;
      }
    } else {
      backgroundColor = color;
    }
    // 普通按钮
    if (widget.type == ButtonType.normal) {
      borderSide = VanBorder.side();
    } else {
      fontColor = VanColor.white;
    }
    // 文字按钮
    if (widget.type == ButtonType.text) {
      fontColor = VanColor.black;
      height = null;
      width = null;
    }
    // 朴素按钮
    if (widget.plain) {
      borderSide = VanBorder.side(color: widget.color ?? color);
      backgroundColor = VanColor.white;
      fontColor = widget.color ?? color;
    }
    // 圆角
    if (widget.round) {
      borderRadius = VanBorderSize.borderRadiusMax;
    }
    // 方形按钮
    if (widget.square) {
      borderRadius = 0;
    }
    // 迷你按钮
    if (widget.size == ButtonSize.mini) {
      fontSize = VanFontSize.xs;
      height = VanButtonSize.miniHeight;
      padding = VanPadding.buttonMini;
    }
    // 小型按钮
    if (widget.size == ButtonSize.small) {
      fontSize = VanFontSize.sm;
      height = VanButtonSize.smallHeight;
      padding = VanPadding.buttonSmall;
    }
    // 大号按钮
    if (widget.size == ButtonSize.large) {
      fontSize = VanFontSize.lg;
      height = VanButtonSize.largeHeight;
      width = VanButtonSize.largeWidth;
    }
    // 纯icon按钮
    if (widget.text.isEmpty) {
      width = (height ?? 0) + 10;
    }
    // 是否禁用点击
    if (widget.disabled || widget.loading) {
      disabled = true;
    }
  }

  // button样式
  ButtonStyle _buttonStyle() {
    if (widget.gradient != null) {
      borderSide = VanBorder.side(color: Colors.transparent);
    }
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        var pressed = states.contains(MaterialState.pressed);
        // 点击
        if (pressed && widget.disabled == false) {
          // 文字按钮
          if (widget.type == ButtonType.text) {
            return Colors.transparent;
          }
          // 背景为白色
          if (backgroundColor == VanColor.white) {
            return VanColor.gray5.withOpacity(
              VanColor.activeOpacity,
            );
          }
          return backgroundColor.withOpacity(
            VanColor.activeOpacity,
          );
        }
        // 禁用
        if (widget.disabled == true) {
          return backgroundColor.withOpacity(
            VanColor.disabledOpacity,
          );
        }
        return backgroundColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        var pressed = states.contains(MaterialState.pressed);
        if (pressed) {
          return fontColor.withOpacity(VanColor.activeOpacity);
        }
        return fontColor;
      }),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all(
        EdgeInsets.all(0),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
      side: MaterialStateProperty.all(borderSide),
      textStyle: MaterialStateProperty.all(
        TextStyle(fontSize: fontSize),
      ),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
    );
  }

  // button
  Widget _button() {
    if (widget.loading) {
      return _loading();
    }
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        _icon(),
        Container(
          alignment: Alignment.center,
          child: Text(widget.text),
        ),
      ],
    );
  }

  Widget _loading() {
    var loadingColor = VanColor.white;
    var size = 20.0;
    if (widget.plain) {
      loadingColor = color;
    }
    if (widget.size == ButtonSize.mini) {
      size = 13;
    }
    return VanLoading(
      color: loadingColor,
      size: size,
      text: widget.loadingText,
      textColor: loadingColor,
      type: widget.loadingType,
    );
  }

  Widget _icon() {
    if (widget.icon == null) {
      return SizedBox.shrink();
    }
    return Row(
      children: [
        Icon(
          widget.icon,
          size: iconSize,
        ),
        SizedBox(
          width: widget.text.isEmpty ? 0 : 5,
        ),
      ],
    );
  }
}

// 类型
enum ButtonType {
  text,
  normal,
  primary,
  success,
  warning,
  danger,
}

// 尺寸
enum ButtonSize {
  large,
  normal,
  small,
  mini,
}
