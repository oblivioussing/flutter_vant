import 'package:flutter/material.dart';

import '/scene/icon/icon.dart';
import '/style/color.dart';
import '/style/size.dart';

class VanEmpty extends StatefulWidget {
  const VanEmpty({
    super.key,
    this.image,
    this.imageSize = 100,
    this.description = '',
  });

  final Image? image;
  final double imageSize;
  final String description;

  @override
  State<VanEmpty> createState() => _VanEmptyState();
}

class _VanEmptyState extends State<VanEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.image ??
              Icon(
                VanIcon.emptyBox,
                size: widget.imageSize,
              ),
          text(),
        ],
      ),
    );
  }

  text() {
    return Text(
      widget.description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: VanColor.gray7,
        fontSize: VanFontSize.lg,
      ),
    );
  }
}
