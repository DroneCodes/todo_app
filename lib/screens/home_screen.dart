import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Tasks",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      body: taskList(),
      floatingActionButton: FloatingActionButton(onPressed: () {}, elevation: 0, backgroundColor: Theme.of(context).primaryColor, child: const Icon(Icons.add, color: Colors.white, size: 30,),),
    );
  }

  taskList() {}
}
