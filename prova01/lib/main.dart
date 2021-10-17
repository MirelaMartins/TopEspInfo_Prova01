import 'package:flutter/material.dart';
import 'package:prova01/form.dart';

void main() => runApp(const OperationMathApp());

class OperationMathApp extends StatelessWidget {
  const OperationMathApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Prova 01",
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Operações Básicas da Matemática'),
          ),
          body: const FormCalculadora(),
        ));
  }
}
