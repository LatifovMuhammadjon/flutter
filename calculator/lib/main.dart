import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator/scale_widget.dart';

import './constants.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalcApp(),
    ),
  );
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  Alignment dayAlign = Alignment.centerLeft;
  Alignment nightAlign = Alignment.centerRight;
  Alignment switchAlign = Alignment.centerLeft;

  Color bgClr = nightBgClr;
  Color numClr = numbersClr;
  Color numTxtClr = white;
  Color resultClr = white;
  Color actRowClr = nightactionsClmnClr;
  Color switchClr = switchBtnBgClr;
  Color switchColor = switchBtnClr;
  TextEditingController controller1 =
      TextEditingController.fromValue(const TextEditingValue(text: "0"));
  TextEditingController controller2 =
      TextEditingController.fromValue(const TextEditingValue(text: "0"));

  changeTheme() {
    setState(() {
      if (switchAlign == dayAlign) {
        switchAlign = nightAlign;
        bgClr = lightBgClr;
        numClr = white;
        numTxtClr = black;
        resultClr = black;
        actRowClr = actionsLightRowClr;
        switchClr = white;
        switchColor = actionsLightRowClr;
      } else {
        switchAlign = dayAlign;
        bgClr = nightBgClr;
        numClr = numbersClr;
        numTxtClr = white;
        resultClr = white;
        actRowClr = nightactionsClmnClr;
        switchClr = switchBtnBgClr;
        switchColor = switchBtnClr;
      }
    });
  }

  void calculate() {
    setState(() {
      try {
        var expr = controller1.text.replaceAll("x", "*").replaceAll("÷", "/");
        Expression exp = Expression(expr);
        if (controller2.text.contains("."))
          controller2.text = exp.eval()!.toStringAsFixed(3);
        else {
          controller2.text = exp.eval().toString();
        }
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgClr,
      statusBarBrightness:
          switchAlign == dayAlign ? Brightness.dark : Brightness.light,
    ));
    return Scaffold(
      backgroundColor: bgClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: switchClr,
                ),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: dayAlign,
                      duration: const Duration(seconds: 1),
                      child: Icon(
                        Icons.sunny,
                        color: actionsClmnnClr,
                        size: size.height * 0.04,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: nightAlign,
                      duration: const Duration(seconds: 1),
                      child: Icon(
                        Icons.mode_night_outlined,
                        color: actionsClmnnClr,
                        size: size.height * 0.04,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: switchAlign,
                      duration: const Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          changeTheme();
                        },
                        child: Container(
                          width: size.height * 0.04,
                          height: size.height * 0.04,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: switchColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: controller1,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: lastAction,
                    fontSize: size.height * 0.04,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: controller2,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: resultClr,
                      fontSize: size.height * 0.08,
                    ),
                  ),
                ),
              ),
              GridView.count(
                padding: const EdgeInsets.symmetric(vertical: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (size.width * .25 / (size.height * .125)),
                crossAxisCount: 4,
                primary: false,
                children: [
                  button(
                      actRowClr,
                      "C",
                      numTxtClr,
                      () => setState(() {
                            controller1.text = "0";
                            controller2.text = "0";
                          })),
                  button(
                      actRowClr,
                      "+/-",
                      numTxtClr,
                      () => setState(() {
                            controller1.text = controller2.text;
                            controller1.text =
                                (-num.parse(controller1.text)).toString();
                            calculate();
                          })),
                  button(
                      actRowClr,
                      "%",
                      numTxtClr,
                      () => setState(() {
                            controller1.text = controller2.text;
                            var a = num.parse(controller1.text) / 100;
                            controller1.text =
                                (a % 1 == 0 ? a.toInt() : a).toString();
                            calculate();
                          })),
                  button(
                      actionsClmnnClr,
                      "÷",
                      white,
                      () => setState(() {
                            if (controller1.text[controller1.text.length - 1]
                                .contains(RegExp(r'[0-9]'))) {
                              controller1.text += "÷";
                            } else {
                              controller1.text = controller1.text.replaceRange(
                                  controller1.text.length - 1,
                                  controller1.text.length,
                                  "÷");
                            }
                          })),
                  button(
                      numClr,
                      "7",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "7";
                            } else {
                              controller1.text += "7";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "8",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "8";
                            } else {
                              controller1.text += "8";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "9",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "9";
                            } else {
                              controller1.text += "9";
                            }
                            calculate();
                          })),
                  button(
                      actionsClmnnClr,
                      "x",
                      white,
                      () => setState(() {
                            if (controller1.text[controller1.text.length - 1]
                                .contains(RegExp(r'[0-9]'))) {
                              controller1.text += "x";
                            } else {
                              controller1.text = controller1.text.replaceRange(
                                  controller1.text.length - 1,
                                  controller1.text.length,
                                  "x");
                            }
                          })),
                  button(
                      numClr,
                      "4",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "4";
                            } else {
                              controller1.text += "4";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "5",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "5";
                            } else {
                              controller1.text += "5";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "6",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "6";
                            } else {
                              controller1.text += "6";
                            }
                            calculate();
                          })),
                  button(
                      actionsClmnnClr,
                      "-",
                      white,
                      () => setState(() {
                            if (controller1.text[controller1.text.length - 1]
                                .contains(RegExp(r'[0-9]'))) {
                              controller1.text += "-";
                            } else {
                              controller1.text = controller1.text.replaceRange(
                                  controller1.text.length - 1,
                                  controller1.text.length,
                                  "-");
                            }
                          })),
                  button(
                      numClr,
                      "1",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "1";
                            } else {
                              controller1.text += "1";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "2",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "2";
                            } else {
                              controller1.text += "2";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "3",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text == "0") {
                              controller1.text = "3";
                            } else {
                              controller1.text += "3";
                            }
                            calculate();
                          })),
                  button(
                      actionsClmnnClr,
                      "+",
                      white,
                      () => setState(() {
                            if (controller1.text[controller1.text.length - 1]
                                .contains(RegExp(r'[0-9]'))) {
                              controller1.text += "+";
                            } else {
                              controller1.text = controller1.text.replaceRange(
                                  controller1.text.length - 1,
                                  controller1.text.length,
                                  "+");
                            }
                          })),
                  button(
                      numClr,
                      ".",
                      numTxtClr,
                      () => setState(() {
                            if (!controller1.text
                                .substring(controller1.text
                                        .lastIndexOf(RegExp(r'[x÷\+\-]')) +
                                    1)
                                .contains(".")) {
                              controller1.text += ".";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "0",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text != "0") {
                              controller1.text += "0";
                            }
                            calculate();
                          })),
                  button(
                      numClr,
                      "DEL",
                      numTxtClr,
                      () => setState(() {
                            if (controller1.text[0] == "-" &&
                                    controller1.text.length == 2 ||
                                controller1.text.length == 1) {
                              controller1.text = "0";
                            } else {
                              controller1.text = controller1.text
                                  .substring(0, controller1.text.length - 1);
                            }
                            calculate();
                          })),
                  button(
                      actionsClmnnClr,
                      "=",
                      white,
                      () => setState(() {
                            controller1.text = controller2.text;
                          })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(Color bgclr, String text, Color numTxtClr,
      [void Function()? onTap]) {
    return scaleWidget(
      onTap: onTap ?? (() {}),
      scale: 0.7,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgclr,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: numTxtClr,
          ),
        ),
      ),
    );
  }
}
