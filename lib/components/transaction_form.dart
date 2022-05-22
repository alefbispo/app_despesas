import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  Function(String, double) onSubmit;
  var titulocontroller = TextEditingController();
  var valorcontroller = TextEditingController();

  TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  _submitForm() {
    final title = titulocontroller.text;
    final value = double.tryParse(valorcontroller.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
    titulocontroller.clear();
    valorcontroller.clear();
  }

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
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valorcontroller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
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
