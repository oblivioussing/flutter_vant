import 'package:flutter/material.dart';
import 'package:flutter_vant/vant.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.title = '',
    this.children = const [],
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VanNavBar(title: title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 10,
          top: 0,
          right: 10,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
    this.text = '',
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
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
