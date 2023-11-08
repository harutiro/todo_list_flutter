import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/view_model/home_view_model.dart';

class TodoList extends HookWidget{

  final HomeViewModel homeViewModel;
  const TodoList(this.homeViewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeViewModel.todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return _menuItem(homeViewModel.todoList[index].title, const Icon(Icons.arrow_forward_ios));
      },
    );
  }
}

Widget _menuItem(String title, Icon icon) {
  return GestureDetector(
    child:Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            // 枠線
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
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
      print("onTap called.");
    },
  );
}
