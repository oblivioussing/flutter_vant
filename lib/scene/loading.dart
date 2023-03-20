import 'package:flutter/material.dart';

import '/scene/icon.dart';
import '/style/color.dart';

class VanLoading extends StatelessWidget {
  const VanLoading({
    Key? key,
    this.color = VanColor.gray5,
    this.type = LoadingType.circular,
    this.size = 25,
    this.text = '',
    this.textSize = 14,
    textColor,
    this.vertical = false,
  })  : textColor =
            textColor ?? (color == VanColor.gray5 ? VanColor.gray6 : color),
        super(key: key);

  final Color color; // 颜色
  final LoadingType type; // 类型
  final double size; // 加载图标大小
  final String text; // 文字
  final double textSize; // 文字大小
  final Color? textColor; // 文字颜色
  final bool vertical; // 是否垂直排列图标和文字内容

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        type == LoadingType.circular ? _circular() : _spinner(),
        _gap(),
        _text(),
      ],
    );
  }

  Widget _circular() {
    return SizedBox(
      height: size - 5,
      width: size - 5,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
  }

  Widget _spinner() {
    return SpinnerLoading(
      color: color,
      size: size,
    );
  }

  Widget _gap() {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: vertical ? 10 : 0,
      width: !vertical ? 10 : 0,
    );
  }

  Widget _text() {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
      ),
    );
  }
}

class SpinnerLoading extends StatefulWidget {
  const SpinnerLoading({
    super.key,
    @required this.color,
    @required this.size,
  });
  final Color? color;
  final double? size;

  @override
  SpinnerLoadingState createState() => SpinnerLoadingState();
}

class SpinnerLoadingState extends State<SpinnerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // 动画控制器

  @override
  void initState() {
    super.initState();
    // 动画控制器
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Icon(
        VanIcon.loading,
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}

enum LoadingType {
  circular,
  spinner,
}
