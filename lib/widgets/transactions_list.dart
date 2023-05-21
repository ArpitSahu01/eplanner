import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transactions.dart';


class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  Widget build(BuildContext context) {
    return  Container(
      height: 450,
      child: transactions.isEmpty?
          Column( children :[
            Text('No Transactions add yet!',
            style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
             child:Image.asset('assets/images/waiting.png',
            fit: BoxFit.cover,
            ),
            ),
          ],)
      : ListView.builder(itemCount: transactions.length,itemBuilder: (BuildContext context,int index) {
          return  Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '₹${transactions[index].amount.toStringAsFixed(1)}',
                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      );
  }
}
