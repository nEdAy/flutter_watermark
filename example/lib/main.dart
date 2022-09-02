import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_watermark/flutter_watermark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RootApp());
  }
}

class RootApp extends StatelessWidget {
  RootApp({super.key});

  // 初始化插件
  final DisableScreenshots _plugin = DisableScreenshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('全局水印'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  // 添加默认样式的水印
                  _plugin.addWatermark(context, "默认水印",
                      rowCount: 4, columnCount: 8);
                },
                child: const Text("添加默认水印")),
            ElevatedButton(
                onPressed: () {
                  // 添加自定义widget当做水印
                  _plugin.addCustomWatermark(context,
                      const Watermark(rowCount: 3, columnCount: 10, text: "自定义水印"));
                },
                child: const Text("添加自定义水印")),
            ElevatedButton(
                onPressed: () {
                  // 移除水印
                  _plugin.removeWatermark();
                },
                child: const Text("删除水印")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Scaffold(
                            appBar: AppBar(
                              title: const Text("我是新页面"),
                            ),
                            body: const Center(child: Text("new page")),
                          )));
                },
                child: const Text("进入新页面"))
          ],
        ),
      ),
    );
  }
}

class Watermark extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final String text;

  const Watermark(
      {Key? key,
      required this.rowCount,
      required this.columnCount,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        children: createColumnWidgets(),
      ),
    );
  }

  List<Widget> createRowWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < rowCount; i++) {
      final widget = Expanded(
          child: Center(
              child: Transform.rotate(
        angle: pi / 10,
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0x08000000),
              fontSize: 18,
              decoration: TextDecoration.none),
        ),
      )));
      list.add(widget);
    }
    return list;
  }

  List<Widget> createColumnWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < columnCount; i++) {
      final widget = Expanded(
          child: Row(
        children: createRowWidgets(),
      ));
      list.add(widget);
    }
    return list;
  }
}
