import 'constant.dart';
import 'ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int sV = 120;
  int age = 20;
  int weight = 45;
  var male = selectedColor;
  var female = blueColor;
  void gCheck(bool gender){
    if (gender){
      male = blueColor;
      female = selectedColor;
    } else{
      female = blueColor;
      male = selectedColor;
    }
  }

  void ageadd(bool ageadd){
    if (ageadd){
      age++;
    }else{
      age--;
    }
  }

  void weightadd(bool weightadd){
    if (weightadd){
      weight++;
    }else{
      weight--;
    }
  }

  void CalBMI(){
    var heightInMeter = sV/100;
    var BMI = weight / (heightInMeter * heightInMeter);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(bmi: BMI.round())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 2,
        centerTitle: true,
        backgroundColor: darkBlueColour,
      ),
      backgroundColor: darkBlueColour,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                        gCheck(true);
                        });
                      },
                      child: ReuseColumn(
                        col: male,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FaIcon(
                                FontAwesomeIcons.mars,
                                size: 75,
                                color: Colors.white,
                              ),
                            ),
                            Text('Male', style: styleG),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                        gCheck(false);
                        });
                      },
                      child: ReuseColumn(
                        col: female,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FaIcon(
                                FontAwesomeIcons.venus,
                                size: 75,
                                color: Colors.white,
                              ),
                            ),
                            Text('Female', style: styleG),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseColumn(
                col: blueColor,
                cardChild: Column(
                  children: [
                    Text('Height', style: styleG),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${sV}', style: styleG),
                        Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Text(
                            'cm',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      min: 120,
                      max: 200,
                      thumbColor: darkBlueColour,
                      activeColor: Color(0xff002B46),
                      inactiveColor: Color(0xff035C89),
                      value: sV.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          sV = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseColumn(
                      col: blueColor,
                      cardChild: Column(
                        children: [
                          Text('Age', style: styleG),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Rawbtn(ico: FontAwesomeIcons.plus,onpressed: (){setState(() {
                                ageadd(true);
                              });}),
                              Rawbtn(ico: FontAwesomeIcons.minus,onpressed: (){setState(() {
                                ageadd(false);
                              });},),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseColumn(
                      col: blueColor,
                      cardChild: Column(
                        children: [
                          Text('Weight', style: styleG),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Rawbtn(ico: FontAwesomeIcons.plus,onpressed: (){setState(() {
                                weightadd(true);
                              });}),
                              Rawbtn(ico: FontAwesomeIcons.minus,onpressed: (){setState(() {
                                weightadd(false);
                              });}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                CalBMI();
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
                child: Text('Calculate BMI',style: styleG,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReuseColumn extends StatelessWidget {
  ReuseColumn({required this.col, required this.cardChild});

  final Color col;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: col,
      ),
      child: cardChild,
    );
  }
}

class Rawbtn extends StatelessWidget {
  Rawbtn({required this.ico, required this.onpressed});

  final IconData ico;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RawMaterialButton(
        onPressed: onpressed,
        constraints: BoxConstraints(minHeight: 40, minWidth: 40),
        shape: CircleBorder(),
        child: Icon(ico),
        fillColor: selectedColor,
        elevation: 2,
      ),
    );
  }
}
