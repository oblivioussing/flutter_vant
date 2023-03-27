import 'package:flutter/material.dart';

import '/scene/cell/cell.dart';
import '/style/color.dart';
import '/style/size.dart';
import '/widget/border.dart';

class VanCellGroup extends StatelessWidget {
  const VanCellGroup({
    this.children = const <VanCell>[],
    this.backgroundColor = VanColor.white,
    this.title = '',
    this.inset = false,
    this.border = true,
  });

  final List<VanCell> children;
  final Color backgroundColor; // 背景色
  final String title; // 分组标题
  final bool inset; // 是否展示为圆角卡片风格
  final bool border; // 是否显示外边框

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadius;
    List<Widget> list = [];
    // 圆角卡片风格
    if (inset) {
      borderRadius = VanBorder.radius(VanBorderSize.borderRadiusLg);
    } else {
      borderRadius = BorderRadius.zero;
    }
    for (var i = 0; i < children.length; i++) {
      list.add(children[i]);
      if (i < children.length - 1) {
        list.add(
          Container(
            margin: EdgeInsets.only(left: VanPadding.md),
            decoration: BoxDecoration(
              border: VanBorder.bottom(),
            ),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        Container(
          decoration: BoxDecoration(
            border: border ? VanBorder.all() : null,
            borderRadius: borderRadius,
            color: backgroundColor,
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Column(
              children: list,
            ),
          ),
        ),
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
