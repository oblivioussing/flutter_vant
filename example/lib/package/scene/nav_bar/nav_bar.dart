import 'package:flutter/material.dart';
import '/package/scene/icon/icon.dart';
import '/package/style/color.dart';

class VanNavBar extends StatelessWidget implements PreferredSizeWidget {
  VanNavBar({
    required this.title,
    this.showMore = false,
  });

  final String title;
  final bool showMore;

  @override
  final Size preferredSize = Size.fromHeight(46);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: _backButtn(context),
      title: _title(),
      actions: [
        _more(context),
      ],
    );
  }

  Widget _iconButton(
    context, {
    required onPressed,
    required icon,
  }) {
    return IconButton(
      onPressed: onPressed,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: Icon(
        icon,
        color: VanColor.black,
        size: 20,
      ),
    );
  }

  Widget _backButtn(context) {
    return _iconButton(
      context,
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: VanIcon.back,
    );
  }

  Widget _title() {
    return Text(
      title,
      style: TextStyle(
        color: VanColor.black,
      ),
    );
  }

  Widget _more(context) {
    if (!showMore) {
      return SizedBox.shrink();
    }
    return _iconButton(
      context,
      onPressed: () {},
      icon: VanIcon.checkMore,
    );
  }
}
