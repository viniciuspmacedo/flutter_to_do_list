import 'package:flutter/material.dart';
import 'package:my_first_app/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Nova Tarefa",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 360,
              height: 620,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 3, color: Colors.black),
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Você deve inserir um nome para a tarefa.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Nome",
                          label: Text("Nome"),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) < 1 ||
                            int.parse(value) > 5) {
                          return "Dificuldade deve ser um número entre 1 e 5.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Dificuldade",
                          label: Text("Dificuldade"),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.url,
                      controller: imageUrlController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira uma URL de imagem!";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          hintText: "URL da imagem",
                          label: Text("URL da imagem"),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder()),
                    ),
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                        child: Image.network(
                          imageUrlController.text,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/images/nophoto.png');
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            TaskInherited.of(widget.taskContext).newTask(
                                nameController.text,
                                imageUrlController.text,
                                int.parse(difficultyController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Inserindo nova tarefa à lista"))
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Adicionar"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
