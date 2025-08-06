import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.bmi});

  final int bmi;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  void initState() {
    // TODO: implement initState
    updateUI();
  }

  var bmiText = 'Normal';
  var bmiTextColor = Color(0xff8FC69F);
  var bmiImage = 'normal';

  void updateUI(){
    if(widget.bmi<18){
      bmiText = 'Underweight';
      bmiTextColor = Color(0xff93B4D7);
      bmiImage = 'underweight';
    }else if(widget.bmi>=18 && widget.bmi<25){
      bmiText = 'Normal';
      bmiTextColor = Color(0xff8FC69F);
      bmiImage = 'normal';
    }else if(widget.bmi>=25 && widget.bmi<30){
      bmiText = 'Overweight';
      bmiTextColor = Color(0xffF9D648);
      bmiImage = 'overweight';
    }else if(widget.bmi>=30 && widget.bmi<35){
      bmiText = 'Obese';
      bmiTextColor = Color(0xffE4985E);
      bmiImage = 'obese';
    }else if(widget.bmi>=35){
      bmiText = 'Extreme';
      bmiTextColor = Color(0xffD65C5B);
      bmiImage = 'extreme';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var weight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlueColour,
        foregroundColor: Colors.white,
      ),
      backgroundColor: darkBlueColour,
      body: Column(
        children: [
          Container(
            width: weight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: blueColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Your BMI value is', style: styleG),
                Text(
                  '${widget.bmi}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${bmiText}',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: bmiTextColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset('images/${bmiImage}.png')),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                  boxShadow: [BoxShadow(color: Colors.black45,blurRadius: 1,spreadRadius: 1,offset: Offset(0, 2))]
              ),
              child: Text('Calculate again',style: styleG,),
            ),
          ),
        ],
      ),
    );
  }
}