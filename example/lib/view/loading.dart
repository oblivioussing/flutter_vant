import 'package:flutter/material.dart';
import 'package:flutter_vant/vant.dart';

import '/share/index.dart';

class LoadingDemo extends StatefulWidget {
  const LoadingDemo({Key? key}) : super(key: key);

  @override
  LoadingDemoState createState() => LoadingDemoState();
}

class LoadingDemoState extends State<LoadingDemo> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Loading',
      children: [
        TextTitle(text: '加载类型'),
        _type(),
        TextTitle(text: '自定义颜色'),
        _color(),
        TextTitle(text: '自定义大小'),
        _size(),
        TextTitle(text: '加载文案'),
        _text(),
        TextTitle(text: '垂直排列'),
        _vertical(),
        TextTitle(text: '自定义文本颜色'),
        _textColor(),
      ],
    );
  }

  Widget _type() {
    return Row(
      children: [
        VanLoading(),
        const SizedBox(width: 13),
        VanLoading(
          type: LoadingType.spinner,
        ),
      ],
    );
  }

  Widget _color() {
    return Row(
      children: [
        VanLoading(
          color: VanColor.primary,
        ),
        const SizedBox(width: 13),
        VanLoading(
          color: VanColor.primary,
          type: LoadingType.spinner,
        ),
      ],
    );
  }

  Widget _size() {
    return Row(
      children: [
        VanLoading(size: 20),
        const SizedBox(width: 13),
        VanLoading(
          size: 40,
          type: LoadingType.spinner,
        ),
      ],
    );
  }

  Widget _text() {
    return Row(
      children: [
        VanLoading(text: '加载中...'),
      ],
    );
  }

  Widget _vertical() {
    return Row(
      children: [
        VanLoading(
          vertical: true,
          text: '加载中...',
        ),
      ],
    );
  }

  Widget _textColor() {
    return Row(
      children: [
        VanLoading(
          color: VanColor.primary,
          text: '加载中...',
          vertical: true,
        ),
        const SizedBox(width: 13),
        const VanLoading(
          text: '加载中...',
          textColor: VanColor.primary,
          vertical: true,
        ),
      ],
    );
  }
}
