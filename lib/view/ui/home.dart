import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view/components/todo_list.dart';
import 'package:todo_list/view/ui/edit_page.dart';

import '../../view_model/home_view_model.dart';

class Home extends HookWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      // 渡すデータ
      create: (context) => HomeViewModel(),
      child: HomeView()
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),//タイトル
        centerTitle: true,//タイトルを真ん中
        backgroundColor: Colors.green,//背景色を指定
        elevation: 40, // Appbar下に影を大きく指定
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final viewModel = Provider.of<HomeViewModel>(context, listen: false);
          viewModel.presentEditPage(context, null);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}