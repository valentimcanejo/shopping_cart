import 'package:flutter/material.dart';
import "package:projeto1/screens/HomePage.dart";
import "package:projeto1/main.dart";

class Pagamento extends StatelessWidget {
  String valorTotal = "";
  Pagamento(String valorTotal) {
    this.valorTotal = valorTotal;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                image: AssetImage("assets/images/done.png"),
                height: 200,
                width: 200),
            const SizedBox(height: 15),
            const Text('Compra Realizada com Sucesso!',
                style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text(
              "Valor Total: R\$ $valorTotal",
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                width: 155,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff25b96f)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: const Text(
                    'Voltar a Loja',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
