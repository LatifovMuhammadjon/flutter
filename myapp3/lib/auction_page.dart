import 'package:flutter/material.dart';

final Color scaffoldColor = const Color(0xfff8f8f8);
final Color textColor = const Color(0xff333333);
final Gradient _gradient = const LinearGradient(
    colors: [Color(0xff0038f5), Color(0xff9f03ff)],
    transform: GradientRotation(45));

class AuctionPage extends StatelessWidget {
  const AuctionPage({Key? key}) : super(key: key);
  // final List<String> articles = final ["color","art"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        elevation: 0,
        centerTitle: false,
        title: Image.asset(
          "assets/Logo.png",
          height: 37,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: textColor,
                size: 24,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_outlined,
                color: textColor,
                size: 24,
              )),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset("assets/img.png",
                height: 430, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Silen Color",
                    style: kTextStyle(
                      color: textColor,
                      size: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: textColor,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.file_upload_outlined,
                      color: textColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xffffd803),
                      Color(0xffff9c80),
                    ], transform: GradientRotation(60)),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "H",
                    style: kTextStyle(
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: Text(
                  "@openart",
                  style: kTextStyle(
                    size: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                style: buttonStyle(
                  color: Colors.white,
                  shadowColor: Colors.black12,
                  elevation: 10,
                  padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                  borderRadius: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              "Together with my design team, we designed this futuristic Cyberyacht concept artwork. We wanted to create something that has not been created yet, so we started to collect ideas of how we imagine the Cyberyacht could look like in the future.",
              style: kTextStyle(
                  color: textColor, size: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              _itemTip("color"),
              _itemTip("cicle"),
              _itemTip("black"),
              _itemTip("art"),
            ],
          ),
        ],
      ),
    );
  }
}

TextButton _itemTip(String article) => TextButton(
      onPressed: () {},
      style: buttonStyle(
        padding: EdgeInsets.symmetric(horizontal: 10),
        borderRadius: 20,
        side: const BorderSide(
          color: Colors.black26,
        ),
        size: Size(50, 30),
      ),
      child: Text(
        "#" + article,
        style:
            kTextStyle(color: textColor, size: 13, fontWeight: FontWeight.bold),
      ),
    );
TextStyle kTextStyle(
    {Color? color,
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    double? height}) {
  return TextStyle(
      color: color ?? const Color(0xff222222),
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

ButtonStyle buttonStyle(
    {Color? color,
    Color? shadowColor,
    double? elevation,
    EdgeInsets? padding,
    double? borderRadius,
    Size? size,
    BorderSide? side}) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(color),
    shadowColor: MaterialStateProperty.all(shadowColor),
    elevation: MaterialStateProperty.all(elevation),
    padding: MaterialStateProperty.all(padding),
    minimumSize: MaterialStateProperty.all(size),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      side: side ?? BorderSide.none,
    )),
  );
}
