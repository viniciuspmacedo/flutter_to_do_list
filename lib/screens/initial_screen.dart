import 'package:flutter/material.dart';
import 'package:my_first_app/screens/form_screen.dart';
import 'package:my_first_app/data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool tasksOpacity = true;
  double globalLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tarefas",
        ),
        leading: Container(),
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      value: globalLevel/100,
                    ),
                  ),
                  Text("Level: $globalLevel")
                ],
              ),
            )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                tasksOpacity = !tasksOpacity;
              });
            },
            icon: tasksOpacity
                ? const Icon(
                    Icons.visibility_off_outlined,
                  )
                : const Icon(
                    Icons.visibility_outlined,
                  ),
          ),
          IconButton(
              onPressed: () {
                double progress = 0;
                TaskInherited.of(context).taskList.forEach((item) {
                  progress += item.level;
                });
                setState(() {
                  globalLevel = progress;
                });
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: AnimatedOpacity(
        opacity: tasksOpacity ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: TaskInherited.of(context).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (newContext) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
