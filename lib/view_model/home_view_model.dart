import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list/view/components/todo_list.dart';

import '../model/todoModel.dart';

class HomeViewModel {

  final todoList = [
    TodoModel(title: "メニュー1", message: "メニュー1のメッセージ"),
    TodoModel(title: "メニュー2", message: "メニュー2のメッセージ"),
    TodoModel(title: "メニュー3", message: "メニュー3のメッセージ"),
    TodoModel(title: "メニュー4", message: "メニュー4のメッセージ"),
  ];

  void onTapMenu(BuildContext context, int index) {
    // TodoListのindexの場所のdoneをtrueにする
    todoList[index].isDone = true;
  }

}