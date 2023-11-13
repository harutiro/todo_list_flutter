import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list/view/components/todo_list.dart';
import 'package:todo_list/view/ui/edit_page.dart';
import 'package:todo_list/view_model/db_todo.dart';

import '../model/todoModel.dart';

class HomeViewModel extends ChangeNotifier{

  List<TodoModel> todoList = [];

  HomeViewModel(){
    readAllTodoDb();
  }

  void readAllTodoDb() {
    // TodoListのindexの場所のdoneをtrueにする
    todoList = DbTodo.readAllTodoDb();
    notifyListeners();
  }

  TodoModel readTodoDb(int index) {
    return DbTodo.readTodoDb(index);
  }

  void addTodoDb(TodoModel todoModel) {
    // TodoListのindexの場所のdoneをtrueにする
    DbTodo.addTodoDb(todoModel);
    readAllTodoDb();
    notifyListeners();
  }

  void updateTodoDb(TodoModel todoModel, int index) async {
    // TodoListのindexの場所のdoneをtrueにする
    DbTodo.updateTodoDb(todoModel, index);
    readAllTodoDb();
  }

  void onTapMenu(BuildContext context, int index) {
    // 編集画面に遷移
    final item = readTodoDb(index);
    presentEditPage(context,item);
  }

  Future<void> presentEditPage(BuildContext context, TodoModel? item) async {
    final resultTodo = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EditPage(item),
    ));

    if (resultTodo != null) {
      // リストのデータを更新
      print("更新");
      print( DbTodo.indexSearch(resultTodo.id));

      if(-1 == DbTodo.indexSearch(resultTodo.id)){
        addTodoDb(resultTodo);
        todoList.forEach((element) {
          print(element.title);
        });
      }else{
        updateTodoDb(resultTodo, DbTodo.indexSearch(resultTodo.id));
        todoList.forEach((element) {
          print(element.title);
        });
      }

      notifyListeners();
    }
  }
}