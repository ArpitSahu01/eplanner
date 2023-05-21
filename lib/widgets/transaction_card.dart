import 'package:flutter/material.dart';



class TransactionCards extends StatefulWidget{

  final Function addTransaction;
  TransactionCards(this.addTransaction);

  @override
  State<TransactionCards> createState() => _TransactionCardsState();
}

class _TransactionCardsState extends State<TransactionCards> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
   final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <=0){
      return ;
    }
   widget.addTransaction(enteredTitle,enteredAmount);
   Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_)=> submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> submitData(),
            ),
            TextButton(
              onPressed: submitData,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.pink[300]
              ),
              child: const Text(
                'Add Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}