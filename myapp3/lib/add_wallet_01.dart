import 'package:flutter/material.dart';

class AddWalletApp extends StatelessWidget {
  const AddWalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddWallet(),
    );
  }
}

class AddWallet extends StatefulWidget {
  AddWallet({Key? key}) : super(key: key);

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  final Gradient _gradient = const LinearGradient(colors: [
    Color(0xff0038f5),
    Color(0xff9f03ff),
  ], transform: GradientRotation(60));
  @override
  Widget build(BuildContext context) {
    int countStep = 3;
    List<String> stepNames = ["Select", "Scan", "Confirm"];
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff8f8f8),
        title: Image.asset(
          "assets/Logo.png",
          height: 45,
          width: 125,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color(0xff222222),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Color(0xff222222),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Add wallet to pay",
              style: kTextStyle(
                size: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Easy to sell ypur Digital Art with 3 steps",
              style: kTextStyle(
                size: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.1 * mWidth),
            child: Row(
              children: List.generate(
                  2 * countStep - 1,
                  ((index) => index % 2 == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: _gradient,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${index ~/ 2 + 1}",
                                  style: kTextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              stepNames[index ~/ 2],
                            ),
                          ],
                        )
                      : const Expanded(
                          child: Padding(
                          padding: EdgeInsets.only(bottom: 18),
                          child: Divider(
                            thickness: 2,
                            height: 5,
                            color: Colors.blueGrey,
                            indent: 10,
                            endIndent: 10,
                          ),
                        )))),
            ),
          ),
          _contentStepper("Bank wallet"),
          _contentStepper("Coin wallet"),
          _contentStepper("Wallet Connect"),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            margin:
                const EdgeInsets.only(bottom: 15, top: 29, left: 15, right: 15),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13), gradient: _gradient),
            child: Text(
              'Earn now',
              style: kTextStyle(
                  size: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {},
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: _gradient,
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white),
                ),
                Container(
                  height: 45,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Text(
                    'Discover more',
                    style: kTextStyle(
                        size: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle kTextStyle(
    {Color? color,
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    double? height}) {
  return TextStyle(
      color: color ?? Color(0xff222222),
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

Widget _contentStepper(String title) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    alignment: Alignment.center,
    width: 343,
    height: 100,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(252, 252, 252, 1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 13),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.add,
                color: Color.fromRGBO(20, 20, 43, 1),
                size: 25,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            title,
            style: kTextStyle(
                size: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xff555555)),
          ),
        ],
      ),
    ),
  );
}
