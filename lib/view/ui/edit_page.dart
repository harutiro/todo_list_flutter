import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Utility/UUIDUtility.dart';
import 'package:uuid/uuid.dart';


import '../../model/todoModel.dart';
import '../../view_model/edit_view_model.dart';

class EditPage extends StatelessWidget {

  final TodoModel? todoModel;

  const EditPage(this.todoModel);

  @override
  Widget build(BuildContext context) {

    final editViewModel = EditViewModel();

    return ChangeNotifierProvider<EditViewModel>(
      create: (context) => editViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('編集画面'),
        ),
        body: Form(todoModel: todoModel),
      )
    );
  }
}

class Form extends StatelessWidget {

  final TodoModel? todoModel;
  const Form({Key? key, this.todoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Use TextEditingController to manage the input text
    final titleController = TextEditingController(text: todoModel?.title ?? '');
    final messageController = TextEditingController(text: todoModel?.message ?? '');

    final editViewModel = Provider.of<EditViewModel>(context);

    return Container(
      // マージンをつける
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16), // 下部にマージンを追加
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'タイトル',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16), // 下部にマージンを追加
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: 'メッセージ',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              editViewModel.saveTodo(
                context,
                titleController.text,
                messageController.text,
                todoModel?.id ?? UUIDUtility.generateUUID(),
                todoModel == null
              );
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}