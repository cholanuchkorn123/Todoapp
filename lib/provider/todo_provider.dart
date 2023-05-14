import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/services/services.dart';

import '../models/todo_model.dart';
part 'todo_provider.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    //caching loading todo status
    @Default(true) bool isLoading,
    required Map<String, List<Todo>> todoModel,
  }) = _TodoState;
  const TodoState._();
}

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(const TodoState(todoModel: {})) {
    //default value
    loadData(0, 10, true, "TODO");
  }
  final _todoStore = Hive.box('boxtodo');
  TodoDataBase db = TodoDataBase();

  loadData(int pageStart, int pageEnd, bool isAsc, String status) async {
    db.loadData();

    final response =
        await Apiservices().getTodoData(pageStart, pageEnd, isAsc, status);

    response.removeWhere((element) => db.deleteItem.contains(element.id));

    Map<String, List> groupDate = {};
    for (var e in response) {
      String date = e.createdAt.split('T')[0];

      if (groupDate.containsKey(date)) {
        groupDate[date]!.add(e);
      } else {
        groupDate[date] = [e];
      }
    }
    

    state = state.copyWith(todoModel: groupDate, isLoading: false);
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, TodoState>((ref) => TodoNotifier());
