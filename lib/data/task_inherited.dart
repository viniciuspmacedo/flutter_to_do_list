import 'package:flutter/material.dart';
import 'package:my_first_app/components/task.dart';
class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task(
        "Aprender Flutter",
        "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
        4),
    Task(
        "Meditar",
        "https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg",
        5),
    Task(
        "Andar de bicicleta",
        "https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg",
        2),
    Task(
        "Ler",
        "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
        1),
  ];

  void newTask(String name, String image, int difficulty){
    taskList.add(Task(name, image, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No Inherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
