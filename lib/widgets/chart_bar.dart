import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  
  final double amount;
  final day;
  final double percent;
  ChartBar({
    required this.amount,
    required this.day,
    required this.percent
  });
  
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        FittedBox(child: Text('₹${amount.toString()}')),
        SizedBox(height: 5,),

        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [

              Container(
                decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1),
                  border: Border.all(
                      color: Colors.grey,
                      width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: 5,),
        Text(day),
      ],
    );
  }
}