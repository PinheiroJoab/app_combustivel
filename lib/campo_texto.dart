import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            'Valor inválido, digite valores maiores que zero e utilize ponto (.).';
      });
    } else {
      if (precoAlcool / precoGasolina >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina.";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com álcool.";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alcóol ou Gasolina?'),
      ),
      body: Center(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(1),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets\\images\\logo.png'),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      textAlign: TextAlign.justify,
                      'Selecione a melhor opção para abastecer seu veículo',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Preço do Álcool, ex R\$2.59',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.green[700])),
                    controller: _controllerAlcool,
                    enabled: true,
                    maxLength: 64,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Preço da Gasolina, ex R\$3.79',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.red[700])),
                    controller: _controllerGasolina,
                    enabled: true,
                    maxLength: 64,
                  ),
                  TextButton(
                      onPressed: _calcular,
                      child: Container(
                          width: 90,
                          height: 30,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Calcular',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _textoResultado,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
