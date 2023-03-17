import 'package:flutter/material.dart';

import '/package/scene/button/button.dart';
import '/package/scene/icon/icon.dart';
import '/package/scene/loading/loading.dart';
import '/package/scene/nav_bar/nav_bar.dart';
import '/package/style/color.dart';

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VanNavBar(title: 'Button'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          bottom: 30,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('按钮类型'),
            _type(),
            _title('朴素按钮'),
            _plain(),
            _title('禁用状态'),
            _disabled(),
            _title('加载状态'),
            _loading(),
            _title('按钮形状'),
            _shape(),
            _title('图标按钮'),
            _icon(),
            _title('按钮尺寸'),
            _size(),
            _title('自定义颜色'),
            _customColor(),
          ],
        ),
      ),
    );
  }

  // 按钮类型
  Widget _type() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            VanButton(
              text: '主要按钮',
              type: ButtonType.primary,
              onPressed: () {},
            ),
            SizedBox(width: 13),
            VanButton(
              text: '成功按钮',
              type: ButtonType.success,
              onPressed: () {},
            ),
            SizedBox(width: 13),
            VanButton(
              text: '默认按钮',
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 7),
        Row(
          children: [
            VanButton(
              text: '危险按钮',
              type: ButtonType.danger,
              onPressed: () {},
            ),
            SizedBox(width: 13),
            VanButton(
              text: '警告按钮',
              type: ButtonType.warning,
              onPressed: () {},
            ),
            SizedBox(width: 13),
            VanButton(
              text: '文字按钮',
              type: ButtonType.text,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  // 朴素按钮
  Widget _plain() {
    return Row(
      children: [
        VanButton(
          text: '朴素按钮',
          type: ButtonType.primary,
          plain: true,
          onPressed: () {},
        ),
        SizedBox(width: 13),
        VanButton(
          text: '朴素按钮',
          type: ButtonType.success,
          plain: true,
          onPressed: () {},
        ),
      ],
    );
  }

  // 禁用状态
  Widget _disabled() {
    return Row(
      children: [
        VanButton(
          text: '禁用按钮',
          type: ButtonType.primary,
          disabled: true,
          onPressed: () {
            print('disabled');
          },
        ),
        SizedBox(width: 13),
        VanButton(
          text: '禁用按钮',
          type: ButtonType.success,
          disabled: true,
          onPressed: () {
            print('disabled');
          },
        ),
      ],
    );
  }

  // 加载状态
  Widget _loading() {
    return Row(
      children: [
        VanButton(
          type: ButtonType.primary,
          loading: true,
          onPressed: () {
            print('disabled');
          },
        ),
        SizedBox(width: 13),
        VanButton(
          text: '保存',
          type: ButtonType.primary,
          loading: true,
          loadingType: LoadingType.spinner,
          onPressed: () {
            print('disabled');
          },
        ),
        SizedBox(width: 13),
        VanButton(
          text: '保存',
          type: ButtonType.success,
          loading: true,
          loadingText: '努力加载中...',
          plain: true,
          width: 150,
          onPressed: () {
            print('disabled');
          },
        ),
      ],
    );
  }

  // 按钮形状
  Widget _shape() {
    return Row(
      children: [
        VanButton(
          text: '方形按钮',
          type: ButtonType.primary,
          square: true,
          onPressed: () {},
        ),
        SizedBox(width: 13),
        VanButton(
          text: '圆形按钮',
          type: ButtonType.success,
          round: true,
          onPressed: () {},
        ),
      ],
    );
  }

  // 图标按钮
  Widget _icon() {
    return Row(
      children: [
        VanButton(
          icon: VanIcon.increase,
          type: ButtonType.primary,
          onPressed: () {},
        ),
        SizedBox(width: 13),
        VanButton(
          text: '按钮',
          icon: VanIcon.increase,
          type: ButtonType.primary,
          onPressed: () {},
        ),
      ],
    );
  }

  // 按钮尺寸
  Widget _size() {
    return Column(
      children: [
        VanButton(
          text: '大号尺寸',
          type: ButtonType.primary,
          size: ButtonSize.large,
          onPressed: () {},
        ),
        SizedBox(height: 7),
        Row(
          children: [
            VanButton(
              text: '普通按钮',
              type: ButtonType.primary,
              onPressed: () {},
            ),
            SizedBox(width: 13),
            VanButton(
              text: '小型按钮',
              type: ButtonType.primary,
              size: ButtonSize.small,
              onPressed: () {},
            ),
            SizedBox(width: 13),
            VanButton(
              text: '迷你按钮',
              type: ButtonType.primary,
              size: ButtonSize.mini,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  // 自定义颜色
  Widget _customColor() {
    return Row(
      children: [
        VanButton(
          backgroundColor: Color.fromRGBO(114, 50, 221, 1),
          text: '单色按钮',
          onPressed: () {},
        ),
        SizedBox(width: 13),
        VanButton(
          color: Color.fromRGBO(114, 50, 221, 1),
          plain: true,
          text: '单色按钮',
          onPressed: () {},
        ),
        SizedBox(width: 13),
        VanButton(
          backgroundColor: Color.fromRGBO(114, 50, 221, 1),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 96, 52, 1),
              Color.fromRGBO(238, 10, 36, 1),
            ],
          ),
          round: true,
          text: '渐变按钮',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _title(text) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        text,
        style: TextStyle(
          color: VanColor.gray7,
        ),
      ),
    );
  }
}
