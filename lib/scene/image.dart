import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VanImage extends StatelessWidget {
  const VanImage({
    super.key,
    this.src = '',
    this.memory,
    this.fit,
    this.height,
    this.width,
    this.radius = 0,
    this.round = false,
    this.showError = true,
    this.showLoading = true,
    this.package,
  });

  final String? src; // 图片链接
  final Uint8List? memory; // Uint8List
  final BoxFit? fit; // 图片填充模式
  final double? height; // 高度
  final double? width; // 宽度
  final double radius; // 圆角大小
  final bool round; // 是否显示为圆形
  final bool showError; // 是否展示图片加载失败提示
  final bool showLoading; // 是否展示图片加载中提示
  final String? package; // 包名

  @override
  Widget build(BuildContext context) {
    // memory
    if (src == '') {
      var image = MemoryImage(memory!);
      return _image(image);
    }
    // network,asset
    var hasHttp = src?.indexOf('http') == 0;
    if (hasHttp) {
      return _netWorkImage(src!);
    } else {
      var image = AssetImage(src!, package: package);
      return _image(image);
    }
  }

  Widget _netWorkImage(String src) {
    return CachedNetworkImage(
      imageUrl: src,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _image(ImageProvider image) {
    return Image(
      image: image,
      fit: fit,
      height: height,
      width: width,
    );
  }
}
