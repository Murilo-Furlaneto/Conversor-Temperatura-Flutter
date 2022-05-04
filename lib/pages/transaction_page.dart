import 'package:conversor_temperatura/pages/home_page.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController fahrenheit = TextEditingController();
  double f = 0, conversao = 0;

  void calcularConversao() {
    setState(() {
      // utilizado quando tive uma alteração no estado
      f = double.parse(fahrenheit.text);

      conversao = (f - 32) / 1.8;
      conversao.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Converter Fahrenheit para Celsius',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset(
                  'assets/termometro.png',
                  fit: BoxFit.contain,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: fahrenheit,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Insira o valor da temperatura ',
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '$conversao °C'.toString(),
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                width: 270,
                height: 50,
                child: ElevatedButton(
                    onPressed: calcularConversao,
                    child: const SizedBox(
                      width: 100,
                      child: Text('Converter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)))),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomePage())));
                  },
                  child: const Text('Trocar conversão: Celsius para Fahrenheit',
                      style: TextStyle(color: Colors.black, fontSize: 14))),
            ],
          ),
        ),
      ),
    );
  }
}
