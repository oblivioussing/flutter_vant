import 'package:flutter/cupertino.dart';

import '/scene/empty.dart';
import '/scene/loading.dart';
import '/style/color.dart';
import '/style/size.dart';

class VanList extends StatefulWidget {
  const VanList({
    super.key,
    required this.count,
    required this.itemBuilder,
    this.loading = false,
    this.finished = false,
    this.offset = 300,
    this.loadingText = '加载中...',
    this.finishedText = '',
    this.errorText = '',
    this.onLoad,
  });
  final int count; // 列表子节点数量
  final IndexedWidgetBuilder itemBuilder; // 列表子节点构造方法
  final bool loading; // 是否处于加载状态
  final bool finished; // 是否已加载完成
  final int offset; // 滚动条与底部距离小于 offset 时触发 load 事件
  final String loadingText; // 加载过程中的提示文案
  final String finishedText; // 加载完成后的提示文案
  final String errorText; // 加载失败后的提示文案
  final VoidCallback? onLoad; // 滚动条与底部距离小于 offset 时触发

  @override
  State<VanList> createState() => VanListState();
}

class VanListState extends State<VanList> {
  var scrollController = ScrollController(); // 滚动控制器
  var loading = false;

  @override
  void initState() {
    super.initState();
    // 滚动事件
    scrollEvent();
  }

  @override
  Widget build(BuildContext context) {
    loading = widget.loading;
    List<Widget> slivers = [];
    if (widget.count == 0) {
      slivers = [
        SliverFillRemaining(
          child: widget.finished
              ? VanEmpty(description: '暂无数据')
              : Center(child: loadingWdt()),
        )
      ];
    } else {
      slivers = [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            widget.itemBuilder,
            childCount: widget.count,
          ),
        ),
        SliverToBoxAdapter(
          child: bottom(), // 底部
        ),
      ];
    }
    return CustomScrollView(
      controller: scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: slivers,
    );
  }

  // 滚动事件
  scrollEvent() {
    scrollController.addListener(() {
      if (loading || widget.finished) {
        return;
      }
      if (scrollController.offset <= 0) {
        return;
      }
      var position = scrollController.position;
      var pixels = position.pixels;
      var maxScrollExtent = position.maxScrollExtent;
      var isBottom = (pixels + widget.offset) >= maxScrollExtent;
      if (isBottom && widget.onLoad != null) {
        loading = true;
        widget.onLoad!();
      }
    });
  }

  // 底部
  Widget? bottom() {
    // 加载完成
    if (widget.finished) {
      if (widget.finishedText == '') {
        return null;
      }
      return Padding(
        padding: const EdgeInsets.only(
          top: VanPadding.base,
          bottom: VanPadding.base,
        ),
        child: Text(
          widget.finishedText,
          style: const TextStyle(
            color: VanColor.gray6,
            fontSize: VanFontSize.md,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    // loading
    return loadingWdt();
  }

  // loading
  Widget? loadingWdt() {
    if (widget.loading) {
      return Padding(
        padding: const EdgeInsets.only(
          top: VanPadding.xs,
          bottom: VanPadding.xs,
        ),
        child: VanLoading(
          text: widget.loadingText,
        ),
      );
    }
    return null;
  }
}
