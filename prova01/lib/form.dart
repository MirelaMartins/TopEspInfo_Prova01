import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCalculadora extends StatefulWidget {
  const FormCalculadora({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormCalculadoraState();
  }
}

class FormCalculadoraState extends State<FormCalculadora> {
  late String primeiroCampo;
  late String segundoCampo;
  late String resultado;

  int operation = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  String? numeroValido(value) {
    final valorCampo = num.tryParse(value);
    if (valorCampo == null) {
      return 'Digite um valor válido!';
    }
    return null;
  }

  Widget buildPrimeiroCampo() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.looks_one_outlined),
          labelText: 'Primeiro Número'),
      validator: numeroValido,
      onSaved: (value) => setState(() => primeiroCampo = value!),
    );
  }

  Widget buildSegundoCampo() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.looks_two_outlined),
          labelText: 'Segundo Número'),
      validator: numeroValido,
      onSaved: (value) => setState(() => segundoCampo = value!),
    );
  }

  void valor(int? value) {
    setState(() => operation = value!);
  }

  Widget buildEscolherOperacao() {
    return Column(
      children: [
        ListTile(
            title: const Text("Adição"),
            leading: Radio(
              value: 1,
              groupValue: operation,
              onChanged: valor,
              activeColor: Colors.purple,
            )),
        ListTile(
            title: const Text("Subtração"),
            leading: Radio(
              value: 2,
              groupValue: operation,
              onChanged: valor,
              activeColor: Colors.purple,
            )),
        ListTile(
            title: const Text("Multiplicação"),
            leading: Radio(
              value: 3,
              groupValue: operation,
              onChanged: valor,
              activeColor: Colors.purple,
            )),
        ListTile(
            title: const Text("Divisão"),
            leading: Radio(
              value: 4,
              groupValue: operation,
              onChanged: valor,
              activeColor: Colors.purple,
            ))
      ],
    );
  }

  Widget buildCampoResultado() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.add_chart_outlined),
          labelText: 'Resultado'),
      controller: controller,
    );
  }

  String result() {
    double num1 = double.parse(primeiroCampo);
    double num2 = double.parse(segundoCampo);
    double result = 0;
    if (operation == 1) {
      result = num1 + num2;
    }
    if (operation == 2) {
      result = num1 - num2;
    }
    if (operation == 3) {
      result = num1 * num2;
    }
    if (operation == 4) {
      result = num1 / num2;
    }
    return result.toString();
  }

  Widget buildBotaoResultado() {
    return ElevatedButton(
        child: const Text('Calcular',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        onPressed: () {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            _formKey.currentState!.save();
            setState(() {
              controller.text = result();
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildPrimeiroCampo(),
                const SizedBox(height: 20),
                buildSegundoCampo(),
                const SizedBox(height: 10),
                buildEscolherOperacao(),
                const SizedBox(height: 20),
                buildBotaoResultado(),
                const SizedBox(height: 20),
                buildCampoResultado(),
              ],
            ),
          ),
        ),
      );
}
