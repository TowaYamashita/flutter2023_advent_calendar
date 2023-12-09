import 'package:flutter/material.dart';

class Layout2Page extends StatefulWidget {
  const Layout2Page({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<Layout2Page> createState() => _Layout2PageState();
}

class _Layout2PageState extends State<Layout2Page> {
  final tabs = const [
    Tab(text: '命令的'),
    Tab(text: '宣言的'),
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
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TabBarView(
            children: [
              _Bad(),
              _Better(),
            ],
          ),
        ),
      ),
    );
  }
}

/// フォームに入力された値を各フォームの値が変更するたびに更新されるローカル変数経由で取得する場合
class _Bad extends StatefulWidget {
  const _Bad();

  @override
  State<_Bad> createState() => _BadState();
}

class _BadState extends State<_Bad> {
  String _username = '';
  String _password = '';

  void _updateUsername(String newUsername) {
    setState(() {
      _username = newUsername;
    });
  }

  void _updatePassword(String newPassword) {
    setState(() {
      _password = newPassword;
    });
  }

  showUserNameAndPassword() {
    final username = _username;
    final password = _password;

    showAdaptiveDialog(
      context: context,
      builder: (_) {
        return AlertDialog.adaptive(
          title: const Text('入力結果'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('username: $username'),
              Text('password: $password'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('閉じる'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          onChanged: (value) => _updateUsername(value),
          decoration: const InputDecoration(
            labelText: 'ユーザ名',
          ),
        ),
        TextFormField(
          onChanged: (value) => _updatePassword(value),
          decoration: const InputDecoration(
            labelText: 'パスワード',
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: showUserNameAndPassword,
          child: const Text('ログイン'),
        ),
      ],
    );
  }
}

/// フォームに入力された値を各フォームの値に割り当てたGlobalKey経由で取得する場合
class _Better extends StatefulWidget {
  const _Better();

  @override
  State<_Better> createState() => _BetterState();
}

class _BetterState extends State<_Better> {
  final usernameForm = GlobalKey<FormFieldState>();
  final passwordForm = GlobalKey<FormFieldState>();

  showUserNameAndPassword() {
    final username = usernameForm.currentState?.value ?? '';
    final password = passwordForm.currentState?.value ?? '';

    showAdaptiveDialog(
      context: context,
      builder: (_) {
        return AlertDialog.adaptive(
          title: const Text('入力結果'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('username: $username'),
              Text('password: $password'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('閉じる'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          key: usernameForm,
          decoration: const InputDecoration(
            labelText: 'ユーザ名',
          ),
        ),
        TextFormField(
          key: passwordForm,
          decoration: const InputDecoration(
            labelText: 'パスワード',
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: showUserNameAndPassword,
          child: const Text('ログイン'),
        ),
      ],
    );
  }
}
