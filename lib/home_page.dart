import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> f = [];
  String fraseSorteada = '';

  void adcionarFrase(String fraseNova){
    setState(() {
      f.add(fraseNova);
    });
  }

  String sortearFrase() {
    if (f.isEmpty) {
      return 'Adicione uma frase para sortear!';
    }
    final random = Random();
    final Aleatorio = random.nextInt(f.length);
    return f[Aleatorio];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text('Motivação do dia'),
        centerTitle: true,

        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String fraseNova = '';
                  return AlertDialog(
                    title: Text('Adicione uma nova frase:'),
                    content: TextField(
                      onChanged: (value) {
                        fraseNova = value;
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          adcionarFrase(fraseNova);
                        },
                        child: Text('Adicionar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fraseSorteada = sortearFrase();
                  print(fraseSorteada);
                });
              },
              child: const Text('Ver frase do dia'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              fraseSorteada,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
