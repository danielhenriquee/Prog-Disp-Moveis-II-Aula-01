import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Código comum para Android e iOS
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 218, 38, 161)),
      ),
      home: const MyHomePage(title: 'Código Comum e Específico'),
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
  static const platform = MethodChannel('com.example.codigo_comum_tarefa_2/platform');
  String _message = 'Clique no botão para ver a mensagem';

  Future<void> _getPlatformMessage() async {
    try {
      final String result = await platform.invokeMethod('getPlatformMessage');
      setState(() {
        _message = result;
      });
    } catch (e) {
      setState(() {
        _message = 'Erro: $e';
      });
    }
  }

  void _clearMessage() {
    setState(() {
      _message = 'Clique no botão para ver a mensagem';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Código comum para Android e iOS',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _getPlatformMessage,
                  child: const Text('Chamar Código Nativo'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _clearMessage,
                  child: const Text('Limpar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
