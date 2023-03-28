import 'package:flutter/cupertino.dart';
import 'package:flutter_vant/vant.dart';

class VanField extends StatefulWidget {
  const VanField({
    super.key,
    this.clearable = false,
    this.controller,
    this.disabled = false,
    this.initialValue,
    this.keyboardType,
    this.label,
    this.labelWidth = 100,
    this.leftIcon,
    this.obscureText = false,
    this.placeholder,
    this.readOnly = false,
    this.rightIcon,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final bool clearable; // 是否启用清除图标
  final TextEditingController? controller; // 文本控制器
  final bool disabled; // 是否禁用输入框
  final String? initialValue; // 初始值
  final TextInputType? keyboardType; // 键盘类型
  final Widget? label; // 输入框左侧文本
  final double labelWidth; // 左侧文本宽度,默认100
  final Widget? leftIcon; // 左侧图标或图片
  final bool obscureText; // 是否为为密码文本
  final String? placeholder; // 输入框占位提示文字
  final bool readOnly; // 是否只读
  final Widget? rightIcon; // 右侧图标或图片
  final ValueChanged<String>? onChanged; // 文本框输入事件
  final Function(String)? onFieldSubmitted; // 输入框完成事件

  @override
  State<VanField> createState() => _VanFieldState();
}

class _VanFieldState extends State<VanField> {
  final ValueNotifier<String> currentValue = ValueNotifier('');
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    controller = widget.controller == null
        ? TextEditingController(text: widget.initialValue ?? '')
        : widget.controller!;
    return Container(
      constraints: BoxConstraints(minHeight: 40),
      padding: EdgeInsets.only(right: VanPadding.xs),
      child: Row(
        children: [
          _leftWdt(), // 左侧widgt
          Expanded(
            child: Column(
              children: [
                _contentWdt(), // 正文widgt
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 左侧widgt
  Widget _leftWdt() {
    List<Widget> list = [];
    var hasLabel = widget.label != null;
    var hasIcon = widget.leftIcon != null;
    if (!hasLabel && !hasIcon) {
      return SizedBox.shrink();
    } else {
      list.add(SizedBox(width: VanPadding.sm));
    }
    if (hasIcon) {
      list.add(widget.leftIcon!);
    }
    if (hasLabel) {
      double size = hasIcon ? 0 : VanPadding.base;
      list.add(
        DefaultTextStyle(
          style: TextStyle(
            color: widget.disabled ? VanColor.gray6 : VanColor.black,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: size),
            child: widget.label,
          ),
        ),
      );
    }
    return Container(
      width: widget.labelWidth,
      child: Row(
        children: list,
      ),
    );
  }

  // 正文widgt
  Widget _contentWdt() {
    List<Widget> list = [
      Expanded(child: _inputWdt()),
    ];
    // clearable
    if (widget.clearable) {
      list.add(_clearableWdt());
    }
    // 右侧icon
    if (widget.rightIcon != null) {
      list.add(widget.rightIcon!);
    }
    return Row(
      children: list,
    );
  }

  // 清除icon widget
  Widget _clearableWdt() {
    return ValueListenableBuilder(
      builder: (context, value, child) {
        if (value.isEmpty) {
          return SizedBox.shrink();
        }
        return GestureDetector(
          child: Icon(
            VanIcon.clear,
            color: VanColor.gray5,
            size: VanFontSize.xs * 2,
          ),
          onTap: () {
            currentValue.value = '';
            controller!.value = TextEditingValue(text: '');
          },
        );
      },
      valueListenable: currentValue,
    );
  }

  // 输入框
  Widget _inputWdt() {
    return CupertinoTextFormFieldRow(
      controller: controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      padding: EdgeInsets.only(left: VanPadding.xs),
      placeholder: widget.placeholder,
      readOnly: widget.disabled ? true : widget.readOnly,
      style: TextStyle(
        color: widget.disabled ? VanColor.gray6 : null,
        fontSize: VanFontSize.md,
      ),
      onChanged: (value) {
        currentValue.value = value;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
