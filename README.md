A new Flutter package helps you add watermarks globally.

## Screenshot

![flutter_watermark](https://github.com/nEdAy/flutter_watermark/raw/main/screenshot/screenshot.png)

## Usage

```dart
    // 初始化插件
    final DisableScreenshots _plugin = DisableScreenshots();
    _f(){
      // 添加默认样式的水印
      _plugin.addWatermark(context, "默认水印", rowCount: 4, columnCount: 8);
      // 添加自定义widget当做水印
      _plugin.addCustomWatermark(context, const Watermark(rowCount: 3, columnCount: 10, text: "自定义水印"));
      // 移除水印
      _plugin.removeWatermark();
    }
```

## Additional information

The idea is borrowed from [disable_screenshots](https://pub.dev/packages/disable_screenshots).