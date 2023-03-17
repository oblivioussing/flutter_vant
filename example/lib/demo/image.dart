import 'package:flutter/material.dart';

import '/package/scene/image/image.dart';
import '/package/scene/nav_bar/nav_bar.dart';
import '/package/style/color.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VanNavBar(title: 'Image'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          top: 0,
          right: 16,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('基础用法'),
            _base(),
            _title('填充模式'),
            _mode(),
            _title('圆形图片'),
            _round(),
            _title('加载中提示'),
            _loading(),
          ],
        ),
      ),
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
        SizedBox(height: 20),
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
            SizedBox(width: 100)
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
        SizedBox(height: 20),
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
            SizedBox(width: 100)
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
        SizedBox(width: 100),
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
    );
  }

  Widget _roundImage({fit = BoxFit}) {
    return ClipOval(
      child: _image(fit: fit),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(text),
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
