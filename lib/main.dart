import 'package:flutter/material.dart';
import 'package:flutter2023_advent_calendar/page/layout1/layout1_page.dart';
import 'package:flutter2023_advent_calendar/page/layout2/layout2_page.dart';
import 'package:flutter2023_advent_calendar/page/layout4/layout4_page.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final patterns = {
      1: '目的にあった適切なWidgetを使用する',
      2: '宣言的な組み方をする',
      4: '画面に表示されるまで描画を遅延させるような組み方をする',
      5: 'Widgetテストが書きやすくなるような組み方をする',
    };

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text(patterns[1] ?? ''),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Layout1Page(
                  title: patterns[1] ?? '',
                );
              }));
            },
          ),
          ListTile(
            title: Text(patterns[2] ?? ''),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Layout2Page(
                  title: patterns[2] ?? '',
                );
              }));
            },
          ),
          ListTile(
            title: Text(patterns[4] ?? ''),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Layout4Page(
                  title: patterns[4] ?? '',
                );
              }));
            },
          ),
          ListTile(
            title: Text(patterns[5] ?? ''),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Layout5Page(
                  title: patterns[5] ?? '',
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
