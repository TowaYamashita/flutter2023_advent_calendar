import 'package:flutter/material.dart';

class Layout5BetterErrorView extends StatelessWidget {
  const Layout5BetterErrorView({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    if (error is Error || error is Exception) {
      return const Center(
        child: Text('エラーが発生しました'),
      );
    }

    return const Center(
      child: Text('不明なエラーが発生しました'),
    );
  }
}
