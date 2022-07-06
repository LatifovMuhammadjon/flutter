import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

TextStyle kTextStyle(
    {Color? color,
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    double? height}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

class _SettingsState extends State<Settings> {
  late bool _isOn;
  @override
  void initState() {
    _isOn = false;
    super.initState();
  }

  final LinearGradient _gradient = const LinearGradient(
      colors: [Colors.white24, Colors.transparent],
      transform: GradientRotation(45));
  final bgColor = const Color(0xff1c1c23);
  final textColor = const Color(0xffa2a2b5);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {},
          icon: Image.asset(
            "assets/ic_arrow_back.png",
            height: 24,
            color: textColor,
          ),
        ),
        title: Text(
          "Settings",
          style: kTextStyle(
              size: 16, fontWeight: FontWeight.w400, color: textColor),
        ),
      ),
      body: SafeArea(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: ((height - 56) * 20 / 63 - 155) / 2.2,
              bottom: ((height - 56) * 20 / 63 - 155) / 11,
            ),
            child: const CircleAvatar(
              radius: 36,
              backgroundImage: AssetImage("assets/avatar.png"),
            ),
          ),
          Text(
            "John Doe",
            style: kTextStyle(
              size: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "j.doe@gmail.com",
            style: kTextStyle(
              size: 12,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: ((height - 56) * 20 / 63 - 155) / 5.5),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                gradient: _gradient,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff333339),
                ),
                child: Text(
                  "Edit profile",
                  style: kTextStyle(
                    fontWeight: FontWeight.w500,
                    size: 12,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 0,
                left: 20,
                right: 20,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  customSection(
                    "General",
                    <Widget>[
                      customButton(
                          const Icon(Icons.language,
                          size: 20,
                          color: Color(0xffc1c1cd),
                          ),
                          "Language",
                          subtitle: "English"),
                      customButton(
                          Image.asset(
                            "assets/ic_face_id.png",
                            height: 20,
                          ),
                          "Security",
                          subtitle: "FaceID"),
                      
                      customButton(
                        Image.asset(
                          "assets/ic_iCloud.png",
                          height: 18,
                        ),
                        "iCloud Sync",
                        trailing: Switch(
                            value: _isOn,
                            onChanged: (newValue) {
                              setState(() {
                                _isOn = !_isOn;
                              });
                            }),
                      ),
                    ],
                  ),
                  customSection(
                    "My subscriptions",
                    <Widget>[
                      customButton(
                          Image.asset(
                            "assets/ic_sorting.png",
                            height: 20,
                          ),
                          "Sorting",
                          subtitle: "Date"),
                      customButton(
                        Image.asset(
                          "assets/ic_chart.png",
                          height: 20,
                        ),
                        "Summary",
                        subtitle: "Average",
                      ),
                      customButton(
                        Image.asset("assets/ic_currency.png", width: 20),
                        "Default Currency",
                        subtitle: "USD (\$)",
                      ),
                    ],
                  ),
                  customSection(
                    "Appearance",
                    <Widget>[
                      customButton(Image.asset("assets/ic_app.png", height: 20),
                          "App icon",
                          subtitle: "Default"),
                      customButton(
                        Image.asset(
                          "assets/ic_theme.png",
                          height: 20,
                        ),
                        "Theme",
                        subtitle: "Dark",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),),
    );
  }
}

Widget customButton(Widget icon, String title,
    {String? subtitle, Widget? trailing}) {
  trailing = trailing ??
      Image.asset(
        "assets/ic_arrow_right.png",
        height: 12,
        fit: BoxFit.contain,
      );
  return InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {},
    child: ListTile(
        leading: icon,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kTextStyle(
                size: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle ?? "",
              textAlign: TextAlign.end,
              style: kTextStyle(
                color: const Color(0xffa2a2b5),
                size: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        trailing: trailing),
  );
}

Widget customSection(String caption, List<Widget> widgets) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          caption,
          textAlign: TextAlign.left,
          style: kTextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.white24, Colors.transparent],
              transform: GradientRotation(45)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color(0xff30303c),
          ),
          child: Column(
            children: widgets,
          ),
        ),
      ),
    ],
  );
}
