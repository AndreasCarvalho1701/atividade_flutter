import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteador de Vencedores',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Sorteador de Vencedores'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> nomes = ['Andreas', 'Beatriz', 'Carlos', 'Daniela', 'Eduardo', 'Fernanda', 'Gustavo', 'Helena'];
  List<String> vencedores = [];
  final Random random = Random();
  String? vencedorAtual;

  void sortearVencedor() {
    if (nomes.isNotEmpty) {
      int index = random.nextInt(nomes.length);
      String sorteado = nomes.removeAt(index);
      setState(() {
        vencedorAtual = sorteado;
        vencedores.add(sorteado);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              vencedorAtual != null ? 'Vencedor: $vencedorAtual' : 'Clique para sortear!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text('Vencedores anteriores:', style: TextStyle(fontWeight: FontWeight.bold)),
            for (String vencedor in vencedores)
              Text(vencedor, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nomes.isNotEmpty ? sortearVencedor : null,
        tooltip: 'Sortear Vencedor',
        backgroundColor: nomes.isNotEmpty ? Colors.blue : Colors.grey,
        child: const Icon(Icons.star),
      ),
    );
  }
}