import 'package:flutter/material.dart';
import "package:projeto1/screens/Pagamento.dart";

class Carrinho extends StatefulWidget {
  final bool laranjaSelecionada,
      morangoSelecionado,
      uvaSelecionada,
      bananaSelecionada;

  const Carrinho(
      {Key? key,
      required this.laranjaSelecionada,
      required this.morangoSelecionado,
      required this.uvaSelecionada,
      required this.bananaSelecionada})
      : super(key: key);

  @override
  AtualizadorTextoEstado createState() => AtualizadorTextoEstado();
}

class AtualizadorTextoEstado extends State<Carrinho> {
  int numLaranjas = 0;
  int numMorangos = 0;
  int numUva = 0;
  int numBananas = 0;

  double precoLaranja = 2.5,
      precoMorango = 3.2,
      precoUva = 4.0,
      precoBanana = 0.99,
      total = 0;
  String formattedNumber = "0.00";

  String textoIMC = "";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void somaPrecoBanana() {
    setState(() {
      precoBanana = precoBanana + 0.99;
      numBananas++;
      total = total + 0.99;

      if (total < 0) {
        formattedNumber = "0.00";
      } else {
        formattedNumber = total.toStringAsFixed(2);
      }
    });
  }

  void subtraiPrecoBanana() {
    setState(() {
      if (numBananas > 0) {
        precoBanana = precoBanana - 0.99;
        numBananas--;
        total = total - 0.99;
        if (total < 0) {
          formattedNumber = "0.00";
        } else {
          formattedNumber = total.toStringAsFixed(2);
        }
      }
    });
  }

  void somaPrecoLaranja() {
    setState(() {
      precoLaranja = precoLaranja + 2.5;
      numLaranjas++;
      total = total + 2.5;

      if (total < 0) {
        formattedNumber = "0.00";
      } else {
        formattedNumber = total.toStringAsFixed(2);
      }
    });
  }

  void subtraiPrecoLaranja() {
    setState(() {
      if (numLaranjas > 0) {
        precoLaranja = precoLaranja - 2.5;
        numLaranjas--;
        total = total - 2.5;
        if (total < 0) {
          formattedNumber = "0.00";
        } else {
          formattedNumber = total.toStringAsFixed(2);
        }
      }
    });
  }

  void subtraiPrecoMorango() {
    setState(() {
      if (numMorangos > 0) {
        precoMorango = precoMorango - 3.2;
        numMorangos--;
        total = total - 3.2;
        if (total < 0) {
          formattedNumber = "0.00";
        } else {
          formattedNumber = total.toStringAsFixed(2);
        }
      }
    });
  }

  void subtraiPrecoUva() {
    setState(() {
      if (numUva > 0) {
        precoUva = precoUva - 4.0;
        numUva--;
        total = total - 4.0;
        if (total < 0) {
          formattedNumber = "0.00";
        } else {
          formattedNumber = total.toStringAsFixed(2);
        }
      }
    });
  }

  void somaPrecoMorango() {
    setState(() {
      precoMorango = precoMorango + 3.2;
      numMorangos++;
      total = total + 3.2;
      if (total < 0) {
        formattedNumber = "0.00";
      } else {
        formattedNumber = total.toStringAsFixed(2);
      }
    });
  }

  void somaPrecoUva() {
    setState(() {
      precoUva = precoUva + 4.0;
      numUva++;
      total = total + 4.0;
      if (total < 0) {
        formattedNumber = "0.00";
      } else {
        formattedNumber = total.toStringAsFixed(2);
      }
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          if (widget.laranjaSelecionada) somaPrecoLaranja(),
          if (widget.morangoSelecionado) somaPrecoMorango(),
          if (widget.uvaSelecionada) somaPrecoUva(),
          if (widget.bananaSelecionada) somaPrecoBanana()
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
            child: Column(children: [
          Visibility(
            visible: widget.bananaSelecionada,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListTile(
                  leading: const Image(
                      image: AssetImage("assets/images/banana.png")),
                  title: const Text('Banana', style: TextStyle(fontSize: 20.0)),
                  subtitle:
                      const Text('R\$ 0.99', style: TextStyle(fontSize: 20.0)),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.red),
                        onPressed: subtraiPrecoBanana,
                      ),
                      Text('$numBananas',
                          style: const TextStyle(fontSize: 24.0)),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.green),
                        onPressed: somaPrecoBanana,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.laranjaSelecionada,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListTile(
                  leading: const Image(
                      image: AssetImage("assets/images/orange.png")),
                  title:
                      const Text('Laranja', style: TextStyle(fontSize: 20.0)),
                  subtitle:
                      const Text('R\$ 2.50', style: TextStyle(fontSize: 20.0)),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.red),
                        onPressed: subtraiPrecoLaranja,
                      ),
                      Text('$numLaranjas',
                          style: const TextStyle(fontSize: 24.0)),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.green),
                        onPressed: somaPrecoLaranja,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: widget.morangoSelecionado,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListTile(
                    leading: const Image(
                        image: AssetImage("assets/images/strawberry.png")),
                    title:
                        const Text('Morango', style: TextStyle(fontSize: 20.0)),
                    subtitle: const Text('R\$ 3.20',
                        style: TextStyle(fontSize: 20.0)),
                    trailing: Wrap(
                      spacing: 12,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.red),
                          onPressed: subtraiPrecoMorango,
                        ),
                        Text('$numMorangos',
                            style: const TextStyle(fontSize: 24.0)),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.green),
                          onPressed: somaPrecoMorango,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Visibility(
              visible: widget.uvaSelecionada,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: ListTile(
                    leading: const Image(
                        image: AssetImage("assets/images/grapes.png")),
                    title: const Text('Uva', style: TextStyle(fontSize: 20.0)),
                    subtitle: const Text('R\$ 4.00',
                        style: TextStyle(fontSize: 20.0)),
                    trailing: Wrap(
                      spacing: 12,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.red),
                          onPressed: subtraiPrecoUva,
                        ),
                        Text('$numUva', style: const TextStyle(fontSize: 24.0)),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.green),
                          onPressed: somaPrecoUva,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 30),
          Text("Valor total: R\$$formattedNumber",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 100),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(70),
                      foregroundColor: Colors.white,
                      backgroundColor:
                          total == 0 ? Colors.grey : Colors.greenAccent,
                    ),
                    onPressed: total == 0 || formattedNumber == "0.00"
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Pagamento(formattedNumber),
                              ),
                            );
                          },
                    child: const Text(
                      'Finalizar Compra',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ))),
          const SizedBox(height: 30),
        ])));
  }
}
