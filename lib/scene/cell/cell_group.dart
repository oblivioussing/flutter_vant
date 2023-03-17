import 'package:flutter/material.dart';

import '/scene/cell/cell.dart';
import '/style/color.dart';
import '/style/size.dart';
import '/widget/border.dart';

class VanCellGroup extends StatelessWidget {
  const VanCellGroup({
    Key? key,
    this.children = const <VanCell>[],
    this.backgroundColor = VanColor.white,
    this.title = '',
    this.inset = false,
    this.border = true,
  }) : super(key: key);

  final List<VanCell> children;
  final Color backgroundColor; // 背景色
  final String title; // 分组标题
  final bool inset; // 是否展示为圆角卡片风格
  final bool border; // 是否显示外边框

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadius;
    EdgeInsets? margin;
    // 圆角卡片风格
    if (inset) {
      margin = const EdgeInsets.only(
        left: VanPadding.md,
        right: VanPadding.md,
      );
      borderRadius = VanBorder.radius(VanBorderSize.borderRadiusMd);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          margin: margin,
          child: Column(
            children: children,
          ),
        )
      ],
    );
  }

  Widget _title() {
    if (title == '') {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: VanPadding.md,
        top: VanPadding.xs,
        bottom: VanPadding.xs,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: VanColor.gray6,
        ),
      ),
    );
  }
}
