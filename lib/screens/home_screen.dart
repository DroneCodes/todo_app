import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Tasks",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: taskList(),
      floatingActionButton: FloatingActionButton(
        // TODO add a widget for the onPressed function
        onPressed: () {},
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  taskList() {
    return StreamBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data["tasks"] != null) {
            if (snapshot.data["tasks"].length != 0) {
              return ListView.builder(
                  itemCount: snapshot.data["tasks"].length,
                  itemBuilder: (context, index) {
                    int reverseIndex =
                        snapshot.data["tasks"].length - index - 1;
                    return TaskCard(snap: snapshot.data["tasks"]);
                  });
            } else {
              //TODO make sure to add a widget here
              return Column();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
        return const Center();
      },
      stream: tasks,
    );
  }
}
