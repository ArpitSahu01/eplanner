import 'package:flutter/material.dart';
import '../model/transactions.dart';
import './transactions_list.dart';
import './transaction_card.dart';
import './chart.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transactions> transactions = [];
  
  List<Transactions> get recentTransactions{
    return transactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransactions(String title, double amount) {
    var addTx = Transactions(
      id: DateTime.now(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(addTx);
    });

  }

  void startNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder:(_){
      return GestureDetector(
        onTap: (){},
        child: TransactionCards(addTransactions),
        behavior: HitTestBehavior.opaque,
      );
    },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Planner'),

        actions: [
          IconButton(onPressed: ()=>startNewTransaction(context), icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransactions),
            TransactionList(transactions),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>startNewTransaction(context) ,
      ),
    );
  }
}


