import 'package:flutter/material.dart';
import 'package:myapp3/register1.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _value;
  final textColor = const Color(0xff666680);
  @override
  void initState() {
    super.initState();
    _value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c23),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1c1c23),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 56),
              child: Image.asset(
                "assets/logo_trackizer.png",
                height: 24,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    textAlign: TextAlign.left,
                    style: kTextStyle(
                      size: 12,
                      color: textColor,
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                  Text(
                    "Password",
                    textAlign: TextAlign.left,
                    style: kTextStyle(
                      size: 12,
                      color: textColor,
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: _value,
                          onChanged: (checked) {
                            setState(() {
                              _value = !_value;
                            });
                          }),
                      Text(
                        "Remember me",
                        style: kTextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          size: 12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Forgot password",
                          textAlign: TextAlign.end,
                          style: kTextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: Color(0xffff7966),
                      ),
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: kTextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                        "If you don't have an account?",
                        style: kTextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ),
                  
                  InkWell(
                    onTap: () {
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Registration()),
  );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: Color(0xff333339),
                      ),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: kTextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
