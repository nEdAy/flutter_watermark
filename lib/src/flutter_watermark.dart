import 'package:flutter/material.dart';

import 'flutter_watermark_widget.dart';

class DisableScreenshots {
  static final DisableScreenshots _singleton = DisableScreenshots._internal();
  factory DisableScreenshots() {
    return _singleton;
  }
  DisableScreenshots._internal();

  OverlayEntry? _overlayEntry;

  /// 添加默认水印
  ///
  /// [watermark] 水印文案
  /// [rowCount] 水印文案每行显示的个数
  /// [columnCount] 水印文案每列显示的个数
  /// [textStyle] 水印文案的样式
  void addWatermark(BuildContext context, String watermark,
      {int rowCount = 3, int columnCount = 10, TextStyle? textStyle}) async {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
        builder: (context) => DisableScreenshotsWatermark(
              rowCount: rowCount,
              columnCount: columnCount,
              text: watermark,
              textStyle: textStyle ??
                  const TextStyle(
                      color: Color(0x08000000),
                      fontSize: 18,
                      decoration: TextDecoration.none),
            ));
    overlayState?.insert(_overlayEntry!);
  }

  /// 添加自定义水印。将[widget]覆盖在所有视图的最上层
  void addCustomWatermark(BuildContext context, Widget widget) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) => widget);
    overlayState?.insert(_overlayEntry!);
  }

  /// 移除水印
  void removeWatermark() async {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
