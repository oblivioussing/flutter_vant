import 'package:flutter/material.dart';

import '/package/scene/icon/icon.dart';
import '/package/scene/nav_bar/nav_bar.dart';
import '/package/style/color.dart';
import '/package/style/size.dart';
import '/package/widget/border.dart';

class IconDemo extends StatefulWidget {
  const IconDemo({Key? key}) : super(key: key);

  @override
  _IconDemoState createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  var _iconMap = {
    'delete': VanIcon.delete,
    'increase': VanIcon.increase,
    'close': VanIcon.close,
    'down': VanIcon.down,
    'upward': VanIcon.upward,
    'next': VanIcon.next,
    'back': VanIcon.back,
    'nickname': VanIcon.nickname,
    'address': VanIcon.address,
    'check_more': VanIcon.checkMore,
    'clock': VanIcon.clock,
    'search': VanIcon.search,
    'loading': VanIcon.loading,
    'photo': VanIcon.photo,
    'photo_fail': VanIcon.photoFail,
    'empty_box': VanIcon.emptyBox,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VanNavBar(title: 'Icon'),
      backgroundColor: VanColor.gray1,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: VanBorder.radius(
            VanBorderSize.borderRadiusLg,
          ),
          color: VanColor.white,
        ),
        margin: EdgeInsets.all(20),
        child: _grid(),
      ),
    );
  }

  Widget _grid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: _gridList(),
    );
  }

  List<Widget> _gridList() {
    List<Widget> list = [];
    _iconMap.forEach((key, value) {
      list.add(
        _gridItem(name: key, icon: value),
      );
    });
    return list;
  }

  Widget _gridItem({name = String, icon = IconData}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}
