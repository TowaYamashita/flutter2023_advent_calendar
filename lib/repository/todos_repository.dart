import 'dart:convert';

import 'package:flutter2023_advent_calendar/model/todos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final todosRepositoryProvider = Provider<TodosRepository>((_) {
  return const TodosRepository(authority: 'dummyjson.com');
});

class TodosRepository {
  const TodosRepository({
    required this.authority,
  });

  final String authority;

  Future<Todos> fetch() async {
    final response = await http.get(Uri.https(authority, '/todos'));
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Todos.fromJson(json);
  }
}
