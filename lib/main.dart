import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConsultaCepPage(),
      debugShowCheckedModeBanner: false,
      title: 'Consulta CEP',
    );
  }
}

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  final TextEditingController _cepController = TextEditingController();
  String _resultado = '';

  Future<void> _consultarCep() async {
    final cep = _cepController.text.trim();
    if (cep.isEmpty) {
      setState(() {
        _resultado = 'Informe um CEP válido!';
      });
      return;
    }
    final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['erro'] == true) {
          setState(() {
            _resultado = 'CEP não encontrado!';
          });
        } else {
          setState(() {
            _resultado =
                'CEP: ${data['cep']}\nLogradouro: ${data['logradouro']}\nBairro: ${data['bairro']}\nCidade: ${data['localidade']}\nUF: ${data['uf']}';
          });
        }
      } else {
        setState(() {
          _resultado = 'Erro na consulta!';
        });
      }
    } catch (e) {
      setState(() {
        _resultado = 'Erro: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta CEP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Informe o CEP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text(_resultado),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _consultarCep,
        child: const Icon(Icons.search),
      ),
    );
  }
}
