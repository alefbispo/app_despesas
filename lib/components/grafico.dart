import 'package:flutter/material.dart';

class Grafico extends StatelessWidget {
  const Grafico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 5,
        child: Text(
          'Gráfico',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
