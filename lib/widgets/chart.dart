import '../widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transactions.dart';

class Chart extends StatelessWidget{

  final List<Transactions> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String,Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = recentTransactions.fold(0.0, (sum, element) {
        return (element.date.year == weekDay.year &&
            element.date.month == weekDay.month &&
            element.date.day == weekDay.day)
            ? sum + element.amount : 0.0;
      });

      // double totalSum=0;
      //
      // for(int i=0;i<recentTransactions.length;i++){
      //   if(recentTransactions[i].date?.day  == weekDay.day &&
      //       recentTransactions[i].date?.month == weekDay.month &&
      //       recentTransactions[i].date?.year == weekDay.year){
      //     totalSum += recentTransactions[i].amount!;
      //   }
      // }

      // print(DateFormat.E().format(weekDay).substring(0, 3));
      // print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum
      };
    }).toList();
  }

 double get totalSpending {
   return groupedTransactions.fold(0.0, (sum, element) {
     return sum + (element['amount'] as double);
   });
 }

  Widget build(BuildContext context){
    print(groupedTransactions);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
         children: groupedTransactions.map((element){
           return  Expanded(
             child: ChartBar(
              amount: (element['amount'] as double),
              day: element['day'],
              percent: totalSpending==0.0 ? 0.0:(element['amount'] as double)/totalSpending,
               ),
           );
         }).toList(),
          ),
      ),
    );


  }
}