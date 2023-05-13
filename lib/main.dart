import 'package:flutter/material.dart';
import "package:projeto1/screens/HomePage.dart";
import "package:projeto1/screens/Shopping.dart";

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indice = 0;
  bool laranjaSelecionada = false,
      morangoSelecionado = false,
      uvaSelecionada = false;
  void mudarIndice(int index) {
    setState(() {
      indice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Loja de Frutas"),
        ),
        body: IndexedStack(
          children: <Widget>[
            HomePage(),
            Shopping(),
            //CartPage(),
          ],
          index: indice,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.badge),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.shopping_bag),
            //   label: 'Loja',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Loja',
            )
          ],
          selectedItemColor: Colors.greenAccent,
          currentIndex: indice,
          onTap: mudarIndice,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => const HomePage(),
        "/shop": (context) => const Shopping(),
      },
    );
  }
}
