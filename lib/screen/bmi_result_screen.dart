import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final bool isMale ;
  final double result ;
  final int age ;

  BmiResultScreen( this.isMale, this.result, this.age) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0F1D),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0F1D),
        title: Text("BMI Result"),
      ),
      body: Center(
        child: Container(

          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF1A1B2C)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Gender : ${isMale ? "Male" : "Female"}" , style: TextStyle(fontSize: 20 , color: Colors.white),),
              SizedBox(height: 4),
              Text("Age : ${age}" , style: TextStyle(fontSize: 20 , color: Colors.white),),
              SizedBox(height: 4),
              Text("Result : ${result.round()}" , style: TextStyle(fontSize: 20 , color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
