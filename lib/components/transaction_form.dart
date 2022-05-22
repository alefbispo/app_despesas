import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  Function(String, double) onSubmit;

  TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titulocontroller = TextEditingController();
    var valorcontroller = TextEditingController();
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
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    final title = titulocontroller.text;
                    final value = double.tryParse(valorcontroller.text) ?? 0.0;

                    onSubmit(title, value);
                    titulocontroller.clear();
                    valorcontroller.clear();
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
