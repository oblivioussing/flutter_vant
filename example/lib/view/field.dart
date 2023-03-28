import 'package:flutter/material.dart';
import 'package:flutter_vant/vant.dart';

import '/share/index.dart';

class FieldDemo extends StatefulWidget {
  const FieldDemo({super.key});

  @override
  State<FieldDemo> createState() => _FieldDemoState();
}

class _FieldDemoState extends State<FieldDemo> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Field',
      children: [
        TextTitle(text: '基础用法'),
        _base(),
        TextTitle(text: '自定义类型'),
        _customType(),
        TextTitle(text: '禁用输入框'),
        _disabledInput(),
        TextTitle(text: '显示图标'),
        _iconInput(),
      ],
    );
  }

  Widget _base() {
    return VanCellGroup(
      inset: true,
      children: [
        VanField(
          label: Text('文本'),
          placeholder: '请输入文本',
        ),
      ],
    );
  }

  Widget _customType() {
    return VanCellGroup(
      inset: true,
      children: [
        VanField(
          label: Text('文本'),
          placeholder: '请输入文本',
        ),
        VanField(
          keyboardType: TextInputType.phone,
          label: Text('手机号'),
          placeholder: '请输入手机号',
        ),
        VanField(
          keyboardType: TextInputType.number,
          label: Text('整数'),
          placeholder: '请输入整数',
        ),
        VanField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          label: Text('数字'),
          placeholder: '请输入数字(支持小数)',
        ),
        VanField(
          label: Text('密码'),
          obscureText: true,
          placeholder: '请输入密码',
        ),
      ],
    );
  }

  Widget _disabledInput() {
    return VanCellGroup(
      inset: true,
      children: [
        VanField(
          initialValue: '输入框只读',
          label: Text('文本'),
          placeholder: '输入框只读',
          readOnly: true,
        ),
        VanField(
          disabled: true,
          initialValue: '输入框已禁用',
          label: Text('文本'),
          placeholder: '输入框已禁用',
        ),
      ],
    );
  }

  Widget _iconInput() {
    return VanCellGroup(
      inset: true,
      children: [
        VanField(
          label: Text('文本'),
          leftIcon: Icon(VanIcon.nickname),
          placeholder: '显示图标',
          rightIcon: Icon(VanIcon.address),
        ),
        VanField(
          clearable: true,
          label: Text('文本'),
          leftIcon: Icon(VanIcon.photo),
          placeholder: '显示清除图标',
        ),
      ],
    );
  }
}
