import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/todoModel.dart';

import '../Utility/UUIDUtility.dart';
import 'db_todo.dart';

class EditViewModel extends ChangeNotifier {
  void presentHomePage(BuildContext context,TodoModel? todoModel) {
    notifyListeners();
    Navigator.of(context).pop(todoModel);
  }

  void saveTodo(BuildContext context, String title, String message, String id,bool isNew){
    // Check if title and message are not empty before saving

    var todoModel = TodoModel(title: title, message: message, id: id);

    if (title.isNotEmpty && message.isNotEmpty) {

      todoModel = TodoModel(
          title: title,
          message: message,
          id: isNew ? UUIDUtility.generateUUID() : id
      );

      presentHomePage(context,todoModel);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both title and message.'),
        ),
      );
    }


  }
}