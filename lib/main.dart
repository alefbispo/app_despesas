import 'package:app_despesas/models/transaction.dart';
import 'package:flutter/material.dart';

main() {
  runApp(ExpensesaApp());
}

class ExpensesaApp extends StatelessWidget {
  const ExpensesaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tenis de corrida',
      value: 310.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          SizedBox(
            child: Card(
              elevation: 5,
              child: Text(
                'Gráfico',
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Text('Lista de transações'),
          ),
        ],
      ),
    );
  }
}
