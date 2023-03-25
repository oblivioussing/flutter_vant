import 'package:flutter/material.dart';
import 'package:flutter_vant/vant.dart';

import '/share/index.dart';

class Field extends StatefulWidget {
  const Field({super.key});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Field',
      children: [
        TextTitle(text: '基础用法'),
      ],
    );
  }
}
