import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                image: AssetImage("assets/images/basket.png"),
                height: 250,
                width: 250),
            SizedBox(height: 20),
            Text('Bem Vindo à Loja!',
                style: TextStyle(fontSize: 25, fontFamily: "Roboto"),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
