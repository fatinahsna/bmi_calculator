import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _weightSliderValue = 85;
  double _heightSliderValue = 150;
  double bmi = 0;
  var message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Text("BMI Calculator", style: TextStyle(color: Colors.red, fontSize: 32, fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text("We care about your health"),
          SizedBox(height: 20,),
          Text("Your BMI is ${double.parse(bmi.toStringAsFixed(1))}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("${message}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 30,),
          Text("Height: ${_heightSliderValue.round()} cm", style : TextStyle(fontSize: 20,)),
          Slider(
              value: _heightSliderValue,
              max: 200,
              min: 100,
              label: _heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              }),
          SizedBox(height: 10,),
          Text("Weight: ${_weightSliderValue.round()} kg", style : TextStyle(fontSize: 20,)),
          Slider(
              value: _weightSliderValue,
              max: 150,
              min: 20,
              label: _weightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                });
              }),
          SizedBox(height: 30,),
          TextButton.icon(onPressed: (){
            setState(() {
              bmi = _weightSliderValue / pow((_heightSliderValue/100),2);
              if (bmi < 18.5){
                message = "You are underweight";
              } else if (bmi >= 18.5 && bmi <= 24.9){
                message = "You are normal";
              } else if (bmi >= 25 && bmi <= 29.9){
                message = "You are overweight";
              } else if (bmi >= 30 && bmi <= 34.9){
                message = "You are obese";
              } else {
                message = "You are extreme obese";
              }
            });
          },
            icon: Icon(Icons.favorite), label: Text("Calculate BMI", style : TextStyle(fontSize: 20,)), style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red), // Set the background color to red
          ),),
          SizedBox(height: 55,),
          Image.asset("assets/bmi2.jpg"),
        ],
      ),
    );
  }
}


