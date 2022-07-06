import 'dart:math';
import 'constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1c1c23),
      body: ProgressBar(),
      // ListView(
      //   children: <Widget>[
      //     const Text(
      //       'Canvas',
      //       textAlign: TextAlign.center,
      //       style: TextStyle(fontSize: 20, height: 2),
      //     ),
      //     Container(
      //       width: 400,
      //       height: 400,
      //       child: CustomPaint(
      //         painter: OpenPainter(),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 143;
    var paint1 = Paint()
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xff30303b)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    //draw arc
    canvas.drawArc(
        Offset(size.width / 2 - radius, 50) &
            Size(2 * radius, 2 * radius),
        pi / 6, //radians
        -pi * 4 / 3, //radians
        false,
        paint1);
    paint1.color = Color(0xffffa699);
    canvas.drawArc(
        Offset(size.width / 2 - radius, 50) &
            Size(2 * radius, 2 * radius),
        5*pi / 6, //radians
        pi * 4 * 0.75 / 3, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = false;
  }

  final LinearGradient gradient = const LinearGradient(
      colors: [Colors.white24, Colors.transparent],
      transform: GradientRotation(45));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomPaint(
          child: Container(
            padding: const EdgeInsets.only(top: 125,),
            height: 430,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/logo_trackizer.png",
                  height: 20,
                ),
                Text(
                  "\$1,235",
                  style: kTextStyle(
                    size: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "This month bills",
                  style: kTextStyle(
                    color: Color(0xff83839c),
                    fontWeight: FontWeight.w600,
                    size: 12,
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      gradient: gradient,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff3d3d46),
                      ),
                      child: Text(
                        "See your budget",
                        style: kTextStyle(
                          fontWeight: FontWeight.w600,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: <Widget>[
                      subs(Color(0xffffa699), "Active subs", "12"),
                      subs(Color(0xffad7bff), "Highest subs", "\$29.99"),
                      subs(Color(0xff7dffee), "Lowest subs", "\$5.99"),
                    ],
                  ),
                )
              ],
            ),
          ),
          painter: OpenPainter(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff0e0e12),
          ),
          child: Row(
            children: <Widget>[
              Expanded(child: progressItem("Your subscription", isOn)),
              Expanded(child: progressItem("Upcoming bills", !isOn)),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: <Widget>[
                contextItem(
                    !isOn
                        ? Image.asset(
                            "assets/logo_spotify.png",
                            height: 40,
                          )
                        : dateBox(25, "Jun"),
                    "Spotify",
                    5.99),
                contextItem(
                    !isOn
                        ? Image.asset(
                            "assets/logo_yt.png",
                            height: 40,
                          )
                        : dateBox(25, "Jun"),
                    "YouTube Premium",
                    18.99),
                contextItem(
                    !isOn
                        ? Image.asset(
                            "assets/logo_onedrive.png",
                            height: 40,
                          )
                        : dateBox(25, "Jun"),
                    "One Drive",
                    29.99),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Expanded subs(Color color, String title, String subtitle) {
    return Expanded(
      child: Container(
        height: 68,
        margin: EdgeInsets.all(4),
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff30303c),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 16),
                height: 1,
                width: 46,
                color: color,
              ),
              Text(
                title,
                style: kTextStyle(
                  color: Color(0xff83839c),
                  size: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: kTextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contextItem(Widget leading, String subscriptionName, double price) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff1c1c23),
        border: Border.all(
          color: Color(0xff353542),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: <Widget>[
          leading,
          const SizedBox(
            width: 24,
          ),
          Text(
            subscriptionName,
            style: kTextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              "\$$price",
              style: kTextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget progressItem(String caption, bool isRaised) {
    return isRaised
        ? InkWell(
            onTap: (() => setState(() {
                  isOn = !isOn;
                })),
            child: Text(
              caption,
              textAlign: TextAlign.center,
              style: kTextStyle(
                color: Color(0xffa2a2b5),
                size: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff1b1b22),
              ),
              child: Text(
                caption,
                textAlign: TextAlign.center,
                style: kTextStyle(
                  size: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
  }
}

Widget dateBox(int day, String month) => Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff353542),
      ),
      child: Column(
        children: <Widget>[
          Text(
            month,
            style: kTextStyle(
              size: 10,
              color: Color(0xffa2a2b5),
            ),
          ),
          Text(
            "$day",
            style: kTextStyle(
              color: Color(0xffa2a2b5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
