import 'package:flutter/material.dart';
import 'package:projeto1/screens/Carrinho.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => ShoppingState();
}

class ShoppingState extends State<Shopping> {
  bool laranjaSelecionada = false,
      morangoSelecionado = false,
      uvaSelecionada = false,
      bananaSelecionada = false;
  int existeItem = 0;

  void selecionaBanana() {
    setState(() {
      bananaSelecionada = true;
    });
  }

  void selecionaLaranja() {
    setState(() {
      laranjaSelecionada = true;
    });
  }

  void selecionaMorango() {
    setState(() {
      morangoSelecionado = true;
    });
  }

  void selecionaUva() {
    setState(() {
      uvaSelecionada = true;
    });
  }

  void somaItem() {
    setState(() {
      existeItem++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListTile(
            leading: const Image(image: AssetImage("assets/images/orange.png")),
            title: const Text('Laranja', style: TextStyle(fontSize: 20.0)),
            subtitle: const Text('R\$ 2.00', style: TextStyle(fontSize: 20.0)),
            trailing: SizedBox(
              height: 40,
              width: 100,
              child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.greenAccent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: selecionaLaranja,
                  )),
            ),
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListTile(
            leading: const Image(image: AssetImage("assets/images/banana.png")),
            title: const Text('Banana', style: TextStyle(fontSize: 20.0)),
            subtitle: const Text('R\$ 0.99', style: TextStyle(fontSize: 20.0)),
            trailing: SizedBox(
              height: 40,
              width: 100,
              child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.greenAccent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: selecionaBanana,
                  )),
            ),
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListTile(
            leading:
                const Image(image: AssetImage("assets/images/strawberry.png")),
            title: const Text('Morango', style: TextStyle(fontSize: 20.0)),
            subtitle: const Text('R\$ 3.20', style: TextStyle(fontSize: 20.0)),
            trailing: SizedBox(
              height: 40,
              width: 100,
              child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.greenAccent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: selecionaMorango,
                  )),
            ),
          ),
        ),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListTile(
            leading: const Image(image: AssetImage("assets/images/grapes.png")),
            title: const Text('Uva', style: TextStyle(fontSize: 20.0)),
            subtitle: const Text('R\$ 4.00', style: TextStyle(fontSize: 20.0)),
            trailing: SizedBox(
              height: 40,
              width: 100,
              child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.greenAccent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: selecionaUva,
                  )),
            ),
          ),
        ),
      ),
      const SizedBox(height: 50),
      Expanded(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(70),
                  foregroundColor: Colors.white,
                  backgroundColor: !laranjaSelecionada &&
                          !morangoSelecionado &&
                          !uvaSelecionada &&
                          !bananaSelecionada
                      ? Colors.grey
                      : Colors.greenAccent,
                ),
                onPressed: !laranjaSelecionada &&
                        !morangoSelecionado &&
                        !uvaSelecionada &&
                        !bananaSelecionada
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Carrinho(
                                laranjaSelecionada: laranjaSelecionada,
                                morangoSelecionado: morangoSelecionado,
                                uvaSelecionada: uvaSelecionada,
                                bananaSelecionada: bananaSelecionada),
                          ),
                        );
                      },
                child: const Text(
                  'Ir para Carrinho',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ))),
      const SizedBox(height: 30),
    ]));
  }
}
