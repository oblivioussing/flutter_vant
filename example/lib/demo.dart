import 'package:flutter/material.dart';
import 'package:flutter_vant/main.dart';

import './view/button.dart';
import './view/cell.dart';
import './view/icon.dart';
import './view/image.dart';
import './view/loading.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        color: VanColor.white,
        padding: const EdgeInsets.only(
          top: 30,
          right: 15,
          bottom: 30,
          left: 15,
        ),
        child: SingleChildScrollView(
          child: _menu(),
        ),
      ),
    );
  }

  Widget _menu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('基础组件'),
        _cellBtn('Button 按钮', () {
          _router('button');
        }),
        _cellBtn('Cell 单元格', () {
          _router('cell');
        }),
        _cellBtn('Icon 图标', () {
          _router('icon');
        }),
        _cellBtn('Image 图片', () {
          _router('image');
        }),
        _title('反馈组件'),
        _cellBtn('Loading 加载', () {
          _router('loading');
        }),
      ],
    );
  }

  Widget _cellBtn(String text, onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: VanButton(
        mainAxisAlignment: MainAxisAlignment.start,
        backgroundColor: VanColor.gray1,
        fontColor: VanColor.black,
        round: true,
        text: text,
        width: double.infinity,
        onPressed: onPressed,
      ),
    );
  }

  Widget _title(text) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        left: 20,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: VanColor.gray6,
        ),
      ),
    );
  }

  _router(String path) {
    var map = {
      'button': const ButtonDemo(),
      'cell': const CellDemo(),
      'icon': const IconDemo(),
      'image': const ImageDemo(),
      'loading': const LoadingDemo(),
    };
    var wdt = map[path] ?? Container();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => wdt,
      ),
    );
  }
}
