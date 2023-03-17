import 'package:flutter/material.dart';

import '/package/scene/loading/loading.dart';
import '/package/scene/nav_bar/nav_bar.dart';
import '/package/style/color.dart';

class LoadingDemo extends StatefulWidget {
  const LoadingDemo({Key? key}) : super(key: key);

  @override
  _LoadingDemoState createState() => _LoadingDemoState();
}

class _LoadingDemoState extends State<LoadingDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VanNavBar(title: 'Loading'),
      backgroundColor: VanColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 0,
          right: 10,
          bottom: 30,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('加载类型'),
            _type(),
            _title('自定义颜色'),
            _color(),
            _title('自定义大小'),
            _size(),
            _title('加载文案'),
            _text(),
            _title('垂直排列'),
            _vertical(),
            _title('自定义文本颜色'),
            _textColor(),
          ],
        ),
      ),
    );
  }

  Widget _type() {
    return Row(
      children: [
        VanLoading(),
        SizedBox(width: 13),
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
        SizedBox(width: 13),
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
        SizedBox(width: 13),
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
        SizedBox(width: 13),
        VanLoading(
          text: '加载中...',
          textColor: VanColor.primary,
          vertical: true,
        ),
      ],
    );
  }

  Widget _title(text) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: VanColor.gray6,
        ),
      ),
    );
  }
}
