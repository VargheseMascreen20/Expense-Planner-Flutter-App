// ignore_for_file: avoid_print';
import 'package:flutter/material.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
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
  
  // String? titleInput;
  // String? amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Planner"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                elevation: 5,
                color: Colors.blue,
                child: Text("CHART!"),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      // onChanged: (val) {
                      // titleInput = val;
                      // },
                      controller: titleController,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Amount'),
                      // onChanged: (val) => amountInput = val,
                      controller: amountController,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(128, 0, 128, 100))),
                        onPressed: () {
                          print(titleController.text);
                          // print(titleInput);
                          // // ignore: avoid_print
                          // print(amountInput);
                        },
                        child: const Text("ADD TRANSACTION")),
                  ],
                ),
              ),
            ),
            TransactionList()
          ],
        ),
      ),
    );
  }
}
