import 'package:flutter/material.dart';

const kButtonColorDark = 0xFF333333;
const kTextColorWhite = 0xFFFFFFFF;
const kButtonColorGrey = 0xFFA6A6A6;
const kTextColorBlack = 0xFF000000;
const kButtonColorTangerine = 0xFFf28500;
const kButtonColorYellow = 0xFFFFEB3B;
const kCustomSpace = 20.0;

enum MathOperator {
  None,
  Divide,
  Multiple,
  Subtract,
  Add,
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Iphone Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textString = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          _buildTextField(),
          SizedBox(height: kCustomSpace),
          _buildNumPad(),
        ],
      ),
    );
  }

  _buildTextField() {
    return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.bottomRight,
        child: Text(
          textString,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 72,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  MathOperator _operator = MathOperator.None;
  num firstNum, lastNum;

  _calc(num firstNum, num lastNum, MathOperator operator) {
    String result;
    switch (operator) {
      case MathOperator.None:
        result = textString;
        break;
      case MathOperator.Divide:
        if (lastNum == 0) {
          result = "Error";
        }
        result = (firstNum / lastNum).toString();
        break;
      case MathOperator.Multiple:
        result = (firstNum * lastNum).toString();
        break;
      case MathOperator.Subtract:
        result = (firstNum - lastNum).toString();
        break;
      case MathOperator.Add:
        result = (firstNum + lastNum).toString();
        break;
    }
    return result;
  }

  _buildNumPad() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "AC",
                buttonColor: kButtonColorGrey,
                textColor: kTextColorBlack,
                onPress: () {
                  setState(() {
                    textString = "0";
                    _operator = MathOperator.None;
                    firstNum = 0;
                    lastNum = 0;
                  });
                },
              ),
              CustomButton(
                text: "+/-",
                buttonColor: kButtonColorGrey,
                textColor: kTextColorBlack,
                onPress: () {
                  setState(() {
                    final result = num.parse(textString) * -1;
                    textString = result.toString();
                  });
                },
              ),
              CustomButton(
                text: "%",
                buttonColor: kButtonColorGrey,
                textColor: kTextColorBlack,
                onPress: () {
                  setState(() {
                    textString = (num.parse(textString) / 100).toString();
                  });
                },
              ),
              CustomButton(
                text: "÷",
                buttonColor: kButtonColorTangerine,
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      lastNum = num.parse(textString);
                    } else {
                      firstNum = num.parse(textString);
                    }
                    _operator = MathOperator.Divide;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: kCustomSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "7",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "7" : textString += "7";
                  });
                },
              ),
              CustomButton(
                text: "8",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "8" : textString += "8";
                  });
                },
              ),
              CustomButton(
                text: "9",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "9" : textString += "9";
                  });
                },
              ),
              CustomButton(
                text: "X",
                buttonColor: kButtonColorTangerine,
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      lastNum = num.parse(textString);
                    } else {
                      firstNum = num.parse(textString);
                    }
                    _operator = MathOperator.Multiple;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: kCustomSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "4",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "4" : textString += "4";
                  });
                },
              ),
              CustomButton(
                text: "5",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "5" : textString += "5";
                  });
                },
              ),
              CustomButton(
                text: "6",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "6" : textString += "6";
                  });
                },
              ),
              CustomButton(
                text: "-",
                buttonColor: kButtonColorTangerine,
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      lastNum = num.parse(textString);
                    } else {
                      firstNum = num.parse(textString);
                    }
                    _operator = MathOperator.Subtract;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: kCustomSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "1",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "1" : textString += "1";
                  });
                },
              ),
              CustomButton(
                text: "2",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "2" : textString += "2";
                  });
                },
              ),
              CustomButton(
                text: "3",
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "3" : textString += "3";
                  });
                },
              ),
              CustomButton(
                text: "+",
                buttonColor: kButtonColorTangerine,
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      lastNum = num.parse(textString);
                    } else {
                      firstNum = num.parse(textString);
                    }
                    _operator = MathOperator.Add;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: kCustomSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "0",
                width: 180,
                onPress: () {
                  setState(() {
                    if (_operator != MathOperator.None) {
                      textString = "0";
                    }
                    textString == "0" ? textString = "0" : textString += "0";
                  });
                },
              ),
              CustomButton(
                text: ".",
                onPress: () {
                  setState(() {
                    if (!textString.contains('.')) {
                      textString += ".";
                    }
                  });
                },
              ),
              CustomButton(
                text: "=",
                buttonColor: kButtonColorTangerine,
                onPress: () {
                  lastNum = num.parse(textString);
                  setState(() {
                    final result = _calc(firstNum, lastNum, _operator);
                    textString = result;
                    _operator = MathOperator.None;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final double width;
  final int buttonColor;
  final int textColor;

  CustomButton({
    this.onPress,
    this.text,
    this.width,
    this.buttonColor = kButtonColorDark,
    this.textColor = kTextColorWhite,
  });

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width / 4 - 20;
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width != null ? width : buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(buttonSize / 2),
          color: Color(buttonColor),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Color(textColor),
              fontSize: 30.0,
            ),
          ),
        ),
      ), //............
    );
  }
}
