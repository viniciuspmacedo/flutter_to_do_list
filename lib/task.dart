import 'package:flutter/material.dart';
import 'package:my_first_app/difficult_level.dart';

class Task extends StatefulWidget {
  final String name;
  final String imageUrl;
  final int difficulty;

  const Task(this.name, this.imageUrl, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  int mastery = 0;
  Color masteryColor (){
    switch(mastery){
      case 0: return Colors.blue;
      case 1: return Colors.amber;
      case 2: return Colors.orange;
      case 3: return Colors.red;
      case 4: return Colors.black;
      default: return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (level / widget.difficulty) / 10;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: masteryColor(),
                borderRadius: BorderRadius.circular(4)),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(4)),
                          height: 100,
                          width: 72,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                widget.imageUrl,
                                fit: BoxFit.cover,
                              ))),
                      SizedBox(
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Difficult(difficultLevel: widget.difficulty)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 50,
                          width: 78,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {
                              setState(() {
                                level++;
                                if (progress == 1) {
                                  level = 0;
                                  mastery ++;
                                }
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Lvl UP",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: widget.difficulty >= 1
                            ? progress
                            : 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Nivel: $level",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
