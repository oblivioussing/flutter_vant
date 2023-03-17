import 'package:flutter/material.dart';
import 'package:flutter_vant/main.dart';

class CellDemo extends StatefulWidget {
  const CellDemo({Key? key}) : super(key: key);

  @override
  _CellDemoState createState() => _CellDemoState();
}

class _CellDemoState extends State<CellDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VanNavBar(title: 'Cell'),
      backgroundColor: VanColor.gray1,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 0,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            _base(),
            SizedBox(height: 15),
            _card(),
            SizedBox(height: 15),
            _size(),
            SizedBox(height: 15),
            _icon(),
            SizedBox(height: 15),
            _onlyValue(),
            SizedBox(height: 15),
            _showArrow(),
            SizedBox(height: 15),
            _group(),
            SizedBox(height: 15),
            _slot(),
            SizedBox(height: 15),
            _vertical(),
          ],
        ),
      ),
    );
  }

  // 基础用法
  Widget _base() {
    return VanCellGroup(
      title: '基础用法',
      children: [
        VanCell(
          title: '单元格',
          value: '内容',
        ),
        VanCell(
          title: '单元格',
          value: '内容',
          label: '描述信息',
          last: true,
        ),
      ],
    );
  }

  // 卡片风格
  Widget _card() {
    return VanCellGroup(
      title: '卡片风格',
      inset: true,
      children: [
        VanCell(
          title: '单元格',
          value: '内容',
        ),
        VanCell(
          title: '单元格',
          value: '内容',
          label: '描述信息',
          last: true,
        ),
      ],
    );
  }

  // 单元格大小
  Widget _size() {
    return VanCellGroup(
      title: '单元格大小',
      children: [
        VanCell(
          title: '单元格',
          value: '内容',
          size: CellSize.large,
        ),
        VanCell(
          title: '单元格',
          value: '内容',
          size: CellSize.large,
          label: '描述信息',
          last: true,
        ),
      ],
    );
  }

  // 展示图标
  Widget _icon() {
    return VanCellGroup(
      title: '展示图标',
      children: [
        VanCell(
          icon: Icons.local_airport_sharp,
          title: '单元格',
          value: '内容',
          last: true,
        ),
      ],
    );
  }

  // 只设置 value
  Widget _onlyValue() {
    return VanCellGroup(
      title: '只设置 value',
      children: [
        VanCell(
          value: '内容',
          last: true,
        ),
      ],
    );
  }

  // 展示箭头
  Widget _showArrow() {
    return VanCellGroup(
      title: '展示箭头',
      children: [
        VanCell(
          title: '单元格',
          isLink: true,
        ),
        VanCell(
          title: '单元格',
          value: '内容',
          isLink: true,
          onPressed: () {
            print('单元格');
          },
        ),
        VanCell(
          title: '单元格',
          value: '内容',
          isLink: true,
          arrowDirection: ArrowDirection.down,
          last: true,
        ),
      ],
    );
  }

  // 分组标题
  Widget _group() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15,
            top: 10,
            bottom: 10,
          ),
          child: Text('分组标题'),
        ),
        VanCellGroup(
          title: '分组 1',
          children: [
            VanCell(
              title: '单元格',
              value: '内容',
              last: true,
            ),
          ],
        ),
        VanCellGroup(
          title: '分组 2',
          children: [
            VanCell(
              title: '单元格',
              value: '内容',
              last: true,
            ),
          ],
        )
      ],
    );
  }

  // 使用插槽
  Widget _slot() {
    return VanCellGroup(
      title: '使用插槽',
      children: [
        VanCell(
          titleSlot: Row(
            children: [
              Icon(VanIcon.address),
              Icon(VanIcon.nickname),
            ],
          ),
          value: '内容',
          isLink: true,
        ),
        VanCell(
          title: '单元格',
          valueSlot: Row(
            children: [
              Icon(VanIcon.address),
              Icon(VanIcon.nickname),
            ],
          ),
          last: true,
        ),
      ],
    );
  }

  // 垂直居中
  Widget _vertical() {
    return VanCellGroup(
      title: '垂直居中',
      children: [
        VanCell(
          title: '单元格',
          label: '描述信息',
          value: '内容',
          center: true,
          last: true,
        ),
      ],
    );
  }
}
