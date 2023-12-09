import 'dart:math';

import 'package:flutter/material.dart';

class Layout4Page extends StatefulWidget {
  const Layout4Page({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<Layout4Page> createState() => _Layout4PageState();
}

class _Layout4PageState extends State<Layout4Page> {
  final tabs = const [
    Tab(text: '遅延ロードなし'),
    Tab(text: '遅延ロードあり'),
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

/// 画面外の要素も含めて描画する場合
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
    return ListView(
      children: urlList.map((url) {
        return ListTile(
          leading: Image.network(url),
          title: Text(
            url,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}

/// 画面内の要素のみ描画する場合
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
    return ListView.builder(
      itemCount: urlList.length,
      itemBuilder: (_, i) {
        final url = urlList[i];
        return ListTile(
          leading: Image.network(url),
          title: Text(
            url,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
