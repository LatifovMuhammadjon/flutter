import 'package:flutter/material.dart';
import 'package:myapp3/constants.dart';

class Registration2 extends StatefulWidget {
  const Registration2({Key? key}) : super(key: key);

  @override
  State<Registration2> createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c23),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1c1c23),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.asset(
              "assets/logo_trackizer.png",
              height: 24,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  signupButton(
                    "Apple",
                    Color(0xff1c1c23),
                    btnIcon: Image.asset(
                      "assets/ic_apple.png",
                      height: 16,
                    ),
                  ),
                  signupButton(
                    "Google",
                    Color(0xffffffff),
                    textColor: Colors.black,
                    btnIcon: Image.asset(
                      "assets/ic_google.png",
                      height: 16,
                    ),
                  ),
                  signupButton(
                    "Facebook",
                    Color(0xff1771e6),
                    btnIcon: Image.asset(
                      "assets/ic_facebook.png",
                      height: 16,
                    ),
                  ),
                  Text(
                    "or",
                    style: kTextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "By registering, you agree to our Terms of Use. Learn how we collect use and share your data",
                    textAlign: TextAlign.center,
                    style: kTextStyle(size: 12, color: Color(0xff666680)),
                  ),
                  signupButton("E-mail", Color(0xff333339),onPress: () {
                    
                  },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell signupButton(String btnName, Color btnColor, {Widget? btnIcon,Color textColor=Colors.white, GestureTapCallback? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(999),
          color: btnColor,
        ),
        child: (btnIcon == null
            ? Text("Sign up with " + btnName,
                textAlign: TextAlign.center,
                style: kTextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ))
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  btnIcon,
                  Text("Sign up with " + btnName,
                      textAlign: TextAlign.center,
                      style: kTextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              )),
      ),
    );
  }
}
