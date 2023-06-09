import 'package:flutter/material.dart';
import 'package:flutter_vant/vant.dart';

import '/share/index.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  ImageDemoState createState() => ImageDemoState();
}

class ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Image',
      children: [
        TextTitle(text: '基础用法'),
        _base(),
        TextTitle(text: '填充模式'),
        _mode(),
        TextTitle(text: '圆形图片'),
        _round(),
        TextTitle(text: '加载中提示'),
        _loading(),
      ],
    );
  }

  // 基础用法
  Widget _base() {
    return _image(fit: BoxFit.fill);
  }

  // 填充模式
  Widget _mode() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _image(fit: BoxFit.contain),
                _label('contain'),
              ],
            ),
            Column(
              children: [
                _image(fit: BoxFit.cover),
                _label('cover'),
              ],
            ),
            Column(
              children: [
                _image(fit: BoxFit.fill),
                _label('fill'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _image(fit: BoxFit.none),
                _label('none'),
              ],
            ),
            Column(
              children: [
                _image(fit: BoxFit.scaleDown),
                _label('scaleDown'),
              ],
            ),
            const SizedBox(width: 100)
          ],
        ),
      ],
    );
  }

  // 圆形图片
  Widget _round() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _roundImage(fit: BoxFit.contain),
                _label('contain'),
              ],
            ),
            Column(
              children: [
                _roundImage(fit: BoxFit.cover),
                _label('cover'),
              ],
            ),
            Column(
              children: [
                _roundImage(fit: BoxFit.fill),
                _label('fill'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _roundImage(fit: BoxFit.none),
                _label('none'),
              ],
            ),
            Column(
              children: [
                _roundImage(fit: BoxFit.scaleDown),
                _label('scaleDown'),
              ],
            ),
            const SizedBox(width: 100)
          ],
        ),
      ],
    );
  }

  // 加载中提示
  Widget _loading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _image(
              src: 'https://img.yzcdn.cn/Van/cat.jpeg',
              fit: BoxFit.none,
            ),
            _label('默认提示'),
          ],
        ),
        Column(
          children: [
            _image(fit: BoxFit.none),
            _label('自定义提示'),
          ],
        ),
        const SizedBox(width: 100),
      ],
    );
  }

  Widget _image({
    src = 'image/cat.jpeg',
    fit = BoxFit,
  }) {
    return VanImage(
      src: src,
      fit: fit,
      height: 100,
      width: 100,
      package: 'flutter_vant',
    );
  }

  Widget _roundImage({fit = BoxFit}) {
    return ClipOval(
      child: _image(fit: fit),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(text),
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
