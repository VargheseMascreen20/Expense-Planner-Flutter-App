import 'package:intl/intl.dart';

import './transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense planner",
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 20.22,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Planner"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 5,
              color: Colors.blue,
              child: Text("CHART!"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          DateFormat().format(tx.date!),
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
