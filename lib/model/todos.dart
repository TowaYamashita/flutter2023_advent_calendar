import 'package:flutter2023_advent_calendar/model/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todos.freezed.dart';
part 'todos.g.dart';

@freezed
class Todos with _$Todos {
  factory Todos({
    required List<Todo> todos,
    required int total,
    required int skip,
    required int limit,
  }) = _Todos;

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);
}
