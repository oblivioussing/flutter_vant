import 'package:flutter/material.dart';
import 'package:flutter_vant/vant.dart';

class IconDemo extends StatefulWidget {
  const IconDemo({Key? key}) : super(key: key);

  @override
  IconDemoState createState() => IconDemoState();
}

class IconDemoState extends State<IconDemo> {
  var iconMap = {
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
      appBar: const VanNavBar(title: 'Icon'),
      backgroundColor: VanColor.gray1,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: VanBorder.radius(
            VanBorderSize.borderRadiusLg,
          ),
          color: VanColor.white,
        ),
        margin: const EdgeInsets.all(20),
        child: _grid(),
      ),
    );
  }

  Widget _grid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: _gridList(),
    );
  }

  List<Widget> _gridList() {
    List<Widget> list = [];
    iconMap.forEach((key, value) {
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
        const SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}
