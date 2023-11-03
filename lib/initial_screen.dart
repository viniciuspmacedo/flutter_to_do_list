import 'package:flutter/material.dart';
import 'package:my_first_app/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool tasksOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        leading: Container(),
      ),
      body: AnimatedOpacity(
        opacity: tasksOpacity ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
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
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tasksOpacity = !tasksOpacity;
          });
        },
        backgroundColor: Colors.blue,
        child: tasksOpacity
            ? const Icon(
                Icons.visibility_off_outlined,
                color: Colors.white,
              )
            : const Icon(
                Icons.visibility_outlined,
                color: Colors.white,
              ),
      ),
    );
  }
}
