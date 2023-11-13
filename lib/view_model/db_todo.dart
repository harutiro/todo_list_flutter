import 'package:todo_list/Utility/UUIDUtility.dart';

import '../model/todoModel.dart';

class DbTodo {
  static final todoList = [
    TodoModel(title: "メニュー1", message: "メニュー1のメッセージ", id: UUIDUtility.generateUUID()),
    TodoModel(title: "メニュー2", message: "メニュー2のメッセージ", id: UUIDUtility.generateUUID()),
    TodoModel(title: "メニュー3", message: "メニュー3のメッセージ", id: UUIDUtility.generateUUID()),
    TodoModel(title: "メニュー4", message: "メニュー4のメッセージ", id: UUIDUtility.generateUUID()),
  ];

  static List<TodoModel> readAllTodoDb() {
    // TodoListのindexの場所のdoneをtrueにする
    return DbTodo.todoList;
  }

  static TodoModel readTodoDb(int index) {
    return DbTodo.todoList[index];
  }

  static void addTodoDb(TodoModel todoModel) {
    // TodoListのindexの場所のdoneをtrueにする
    DbTodo.todoList.add(todoModel);
  }

  static void updateTodoDb(TodoModel todoModel, int index) {
    // TodoListのindexの場所のdoneをtrueにする
    DbTodo.todoList[index] = todoModel;
  }

  static String lastId() {
    return DbTodo.todoList.last.id;
  }

  static int indexSearch(String id) {
    return DbTodo.todoList.indexWhere((element) => element.id == id);
  }
}