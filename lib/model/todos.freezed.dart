// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todos _$TodosFromJson(Map<String, dynamic> json) {
  return _Todos.fromJson(json);
}

/// @nodoc
mixin _$Todos {
  List<Todo> get todos => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodosCopyWith<Todos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosCopyWith<$Res> {
  factory $TodosCopyWith(Todos value, $Res Function(Todos) then) =
      _$TodosCopyWithImpl<$Res, Todos>;
  @useResult
  $Res call({List<Todo> todos, int total, int skip, int limit});
}

/// @nodoc
class _$TodosCopyWithImpl<$Res, $Val extends Todos>
    implements $TodosCopyWith<$Res> {
  _$TodosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodosImplCopyWith<$Res> implements $TodosCopyWith<$Res> {
  factory _$$TodosImplCopyWith(
          _$TodosImpl value, $Res Function(_$TodosImpl) then) =
      __$$TodosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Todo> todos, int total, int skip, int limit});
}

/// @nodoc
class __$$TodosImplCopyWithImpl<$Res>
    extends _$TodosCopyWithImpl<$Res, _$TodosImpl>
    implements _$$TodosImplCopyWith<$Res> {
  __$$TodosImplCopyWithImpl(
      _$TodosImpl _value, $Res Function(_$TodosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(_$TodosImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodosImpl implements _Todos {
  _$TodosImpl(
      {required final List<Todo> todos,
      required this.total,
      required this.skip,
      required this.limit})
      : _todos = todos;

  factory _$TodosImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodosImplFromJson(json);

  final List<Todo> _todos;
  @override
  List<Todo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final int total;
  @override
  final int skip;
  @override
  final int limit;

  @override
  String toString() {
    return 'Todos(todos: $todos, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todos), total, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodosImplCopyWith<_$TodosImpl> get copyWith =>
      __$$TodosImplCopyWithImpl<_$TodosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodosImplToJson(
      this,
    );
  }
}

abstract class _Todos implements Todos {
  factory _Todos(
      {required final List<Todo> todos,
      required final int total,
      required final int skip,
      required final int limit}) = _$TodosImpl;

  factory _Todos.fromJson(Map<String, dynamic> json) = _$TodosImpl.fromJson;

  @override
  List<Todo> get todos;
  @override
  int get total;
  @override
  int get skip;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$TodosImplCopyWith<_$TodosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
