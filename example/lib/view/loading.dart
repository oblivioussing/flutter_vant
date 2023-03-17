import 'package:flutter/material.dart';
import 'package:flutter_vant/main.dart';

class LoadingDemo extends StatefulWidget {
  const LoadingDemo({Key? key}) : super(key: key);

  @override
  LoadingDemoState createState() => LoadingDemoState();
}

class LoadingDemoState extends State<LoadingDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VanNavBar(title: 'Loading'),
      backgroundColor: VanColor.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
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

  Widget _title(text) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 15,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: VanColor.gray6,
        ),
      ),
    );
  }
}
