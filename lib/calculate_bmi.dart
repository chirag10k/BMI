import 'package:flutter/material.dart';

class CalculateBMI extends StatefulWidget {
  @override
  _CalculateBMIState createState() => _CalculateBMIState();
}

class _CalculateBMIState extends State<CalculateBMI> {

  TextEditingController hController = new TextEditingController();
  TextEditingController wController = new TextEditingController();

  double bmi;
  String category, bmiName;

  void calculateBMI() {
    setState(() {
      bmi = calcBMI(wController.text, hController.text);
      if(bmi<0)
        category = 'Invalid Details';
      else if(bmi>0 && bmi<18.5)
        category = 'Underweight';
      else if(bmi>=18.5 && bmi<25)
        category = 'Normal';
      else if(bmi>=25 && bmi<30)
        category = 'Overweight';
      else
        category = 'Obese';
      bmiName = 'Your BMI: {bmi.toStringAsFixed(1)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI"
        ),
        backgroundColor: Colors.pink.shade300,
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/bmilogo.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.grey.shade300
                ),
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.person_outline),
                        labelText: "Age",
                      ),
                      style: new TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    new TextField(
                      controller: hController,
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.assessment),
                        labelText: "Height in feet",
                      ),
                      style: new TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    new TextField(
                      controller: wController,
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.line_weight),
                        labelText: "Weight in lb",
                      ),
                      style: new TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new RaisedButton(
                        color: Colors.pink.shade300,
                        child: new Text(
                          "Calculate"
                        ),
                        onPressed: calculateBMI,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              (hController.text.isEmpty || wController.text.isEmpty) ? "Empty fields"
                  :"$bmiName",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
              ),
            ),
            Text(
              "$category",
              style: TextStyle(
                color: Colors.pink.shade300,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calcBMI(String w, String h) {
    double weight = double.parse(w);
    double height = double.parse(h);
    if(weight>0 && height>0){
      return 4.89 * (weight / (height * height));
    }
    else
      return -1;
  }
}
