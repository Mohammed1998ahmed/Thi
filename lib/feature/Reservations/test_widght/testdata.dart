import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
   
final DateTime futureDate=DateTime(2024,9,28);
  @override
  Widget build(BuildContext context) {
    DateTime today=DateTime.now();
print(futureDate.difference(today).inDays.toString());
    int deifference=futureDate.difference(today).inDays;

    return Scaffold(body: Center(child: deifference==1?Text("Ok"):Text("Nokk"),),);
  }
}