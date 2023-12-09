import 'dart:math';

import 'package:flutter/material.dart';

class Layout1Page extends StatefulWidget {
  const Layout1Page({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<Layout1Page> createState() => _Layout1PageState();
}

class _Layout1PageState extends State<Layout1Page> {
  final tabs = const [
    Tab(text: 'LayoutBuilder + Wrap'),
    Tab(text: 'GridView.builder'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(tabs: tabs),
        ),
        body: const TabBarView(
          children: [
            _Bad(),
            _Better(),
          ],
        ),
      ),
    );
  }
}

/// グリッドレイアウトを GridView を使わずに実装した場合
class _Bad extends StatefulWidget {
  const _Bad();

  @override
  State<_Bad> createState() => _BadState();
}

class _BadState extends State<_Bad> {
  final urlList = List.generate(100, (i) {
    final random = Random();
    return 'https://picsum.photos/50/50?random=${random.nextInt(1000)}';
  });

  @override
  Widget build(BuildContext context) {
    /// 横に並べる要素数
    const rowCount = 3;

    /// 要素間の隙間
    const spacer = 10.0;

    return LayoutBuilder(builder: (_, c) {
      /// 利用可能な最大幅(=画面幅)
      final maxWidth = c.maxWidth;

      /// 要素の幅
      final width = (maxWidth - (spacer * (rowCount - 1))) / rowCount;

      return SingleChildScrollView(
        child: Wrap(
          spacing: spacer,
          runSpacing: spacer,
          children: urlList
              .map(
                (e) => SizedBox.square(
                  dimension: width,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(e),
                  ),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}

/// グリッドレイアウトを GridView を用いて実装した場合
class _Better extends StatefulWidget {
  const _Better();

  @override
  State<_Better> createState() => _BetterState();
}

class _BetterState extends State<_Better> {
  final urlList = List.generate(100, (i) {
    final random = Random();
    return 'https://picsum.photos/50/50?random=${random.nextInt(1000)}';
  });

  @override
  Widget build(BuildContext context) {
    /// 横に並べる要素数
    const rowCount = 3;

    /// 要素間の隙間
    const spacer = 10.0;

    return GridView.builder(
      // 横軸に固定数のタイルを持つグリッドレイアウトを実装する際の設定
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rowCount,
        mainAxisSpacing: spacer,
        crossAxisSpacing: spacer,
      ),
      itemBuilder: (_, i) {
        return SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
              urlList[i],
            ),
          ),
        );
      },
      itemCount: urlList.length,
    );
  }
}
