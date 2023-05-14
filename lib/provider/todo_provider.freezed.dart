// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoState {
//caching loading todo status
  bool get isLoading => throw _privateConstructorUsedError;
  Map<String, List> get todoModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call({bool isLoading, Map<String, List> todoModel});
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todoModel = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todoModel: null == todoModel
          ? _value.todoModel
          : todoModel // ignore: cast_nullable_to_non_nullable
              as Map<String, List>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoStateCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$$_TodoStateCopyWith(
          _$_TodoState value, $Res Function(_$_TodoState) then) =
      __$$_TodoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, Map<String, List> todoModel});
}

/// @nodoc
class __$$_TodoStateCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoState>
    implements _$$_TodoStateCopyWith<$Res> {
  __$$_TodoStateCopyWithImpl(
      _$_TodoState _value, $Res Function(_$_TodoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todoModel = null,
  }) {
    return _then(_$_TodoState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todoModel: null == todoModel
          ? _value._todoModel
          : todoModel // ignore: cast_nullable_to_non_nullable
              as Map<String, List>,
    ));
  }
}

/// @nodoc

class _$_TodoState extends _TodoState with DiagnosticableTreeMixin {
  const _$_TodoState(
      {this.isLoading = true, required final Map<String, List> todoModel})
      : _todoModel = todoModel,
        super._();

//caching loading todo status
  @override
  @JsonKey()
  final bool isLoading;
  final Map<String, List> _todoModel;
  @override
  Map<String, List> get todoModel {
    if (_todoModel is EqualUnmodifiableMapView) return _todoModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_todoModel);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoState(isLoading: $isLoading, todoModel: $todoModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('todoModel', todoModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._todoModel, _todoModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_todoModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      __$$_TodoStateCopyWithImpl<_$_TodoState>(this, _$identity);
}

abstract class _TodoState extends TodoState {
  const factory _TodoState(
      {final bool isLoading,
      required final Map<String, List> todoModel}) = _$_TodoState;
  const _TodoState._() : super._();

  @override //caching loading todo status
  bool get isLoading;
  @override
  Map<String, List> get todoModel;
  @override
  @JsonKey(ignore: true)
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
