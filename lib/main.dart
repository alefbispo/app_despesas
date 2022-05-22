import 'package:flutter/material.dart';
import 'components/grafico.dart';
import 'components/transaction_user.dart';

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Despesas Pessoais')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Grafico(),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
