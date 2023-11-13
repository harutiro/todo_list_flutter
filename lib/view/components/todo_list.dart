import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/todoModel.dart';
import 'package:todo_list/view_model/home_view_model.dart';

class TodoList extends HookWidget{
  const TodoList({super.key});
  @override
  Widget build(BuildContext context) {

    // Provider.of<T>(context) で親Widgetからデータを受け取る
    // ※ 受け取るデータの クラス と <T> は揃えましょう
    final viewModel = Provider.of<HomeViewModel>(context);

    return ListView.builder(
        itemCount: viewModel.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return MenuItem(
              viewModel.todoList[index].title,
              const Icon(Icons.arrow_forward_ios),
              index,
              viewModel.todoList[index].isDone
          );
        }
    );
  }
}


class MenuItem extends StatelessWidget{

  final String title;
  final Icon icon;
  final int index;
  final bool isDone;

  const MenuItem(this.title, this.icon, this.index, this.isDone, {super.key});

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<HomeViewModel>(context);

    return GestureDetector(
      child:Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: isDone ? Colors.grey : Colors.white
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child:icon,
              ),
              Text(
                title,
                style: const TextStyle(
                    color:Colors.black,
                    fontSize: 18.0
                ),
              ),
            ],
          )
      ),
      onTap: () {
        viewModel.onTapMenu(context, index);
        print("onTapMenu");
      },
    );
  }
}

