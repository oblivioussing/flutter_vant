import 'package:flutter/material.dart';
import 'package:flutter_vant/vant.dart';

class CellDemo extends StatefulWidget {
  const CellDemo({Key? key}) : super(key: key);

  @override
  CellDemoState createState() => CellDemoState();
}

class CellDemoState extends State<CellDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VanNavBar(title: 'Cell'),
      backgroundColor: VanColor.gray1,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            _base(),
            const SizedBox(height: 15),
            _card(),
            const SizedBox(height: 15),
            _size(),
            const SizedBox(height: 15),
            _icon(),
            const SizedBox(height: 15),
            _onlyValue(),
            const SizedBox(height: 15),
            _showArrow(),
            const SizedBox(height: 15),
            _group(),
            const SizedBox(height: 15),
            _slot(),
            const SizedBox(height: 15),
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
        ),
      ],
    );
  }

  // 卡片风格
  Widget _card() {
    return const Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: VanCellGroup(
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
          ),
        ],
      ),
    );
  }

  // 单元格大小
  Widget _size() {
    return const VanCellGroup(
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
        ),
      ],
    );
  }

  // 展示图标
  Widget _icon() {
    return const VanCellGroup(
      title: '展示图标',
      children: [
        VanCell(
          icon: Icons.local_airport_sharp,
          title: '单元格',
          value: '内容',
        ),
      ],
    );
  }

  // 只设置 value
  Widget _onlyValue() {
    return const VanCellGroup(
      title: '只设置 value',
      children: [
        VanCell(
          value: '内容',
        ),
      ],
    );
  }

  // 展示箭头
  Widget _showArrow() {
    return VanCellGroup(
      title: '展示箭头',
      children: [
        const VanCell(
          title: '单元格',
          isLink: true,
        ),
        VanCell(
          title: '单元格',
          value: '内容',
          isLink: true,
          onPressed: () {},
        ),
        const VanCell(
          title: '单元格',
          value: '内容',
          isLink: true,
          arrowDirection: ArrowDirection.down,
        ),
      ],
    );
  }

  // 分组标题
  Widget _group() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
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
            ),
          ],
        ),
        VanCellGroup(
          title: '分组 2',
          children: [
            VanCell(
              title: '单元格',
              value: '内容',
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
            children: const [
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
            children: const [
              Icon(VanIcon.address),
              Icon(VanIcon.nickname),
            ],
          ),
        ),
      ],
    );
  }

  // 垂直居中
  Widget _vertical() {
    return const VanCellGroup(
      title: '垂直居中',
      children: [
        VanCell(
          title: '单元格',
          label: '描述信息',
          value: '内容',
          center: true,
        ),
      ],
    );
  }
}
