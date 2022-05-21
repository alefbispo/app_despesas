import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  var titulocontroller = TextEditingController();
  var valorcontroller = TextEditingController();
  TransactionForm(
      {Key? key, required this.titulocontroller, required this.valorcontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titulocontroller,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valorcontroller,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print(titulocontroller.text);
                    print(valorcontroller.text);
                  },
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
