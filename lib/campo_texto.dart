import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alcóol ou Gasolina?'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.all(1),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.red, width: 2)),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Digite um valor'),
                enabled: true,
                maxLength: 64,
                onSubmitted: (value) {
                  print('O usuário digitou: ' + value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
