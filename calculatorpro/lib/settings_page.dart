import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            overlayColor: MaterialStateProperty.all(Colors.grey),
            tabs: const <Widget>[
              Tab(
                text: "Settings",
              ),
              Tab(
                text: "Themes",
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Change the text of the main screen",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey[200]),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  color: Colors.black38,
                                  offset: Offset(1, 1),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text("Minimum accuracy"),
                    subtitle: const Text("Limit minimum accuracy to 2 digits"),
                    trailing: Switch(
                        activeColor: Colors.white,
                        value: true,
                        onChanged: (_) {
                          setState(() {});
                        }),
                  ),
                  ListTile(
                    title: const Text("Swipe to count"),
                    subtitle:
                        const Text("Swipe down the keyboard to calculate"),
                    trailing: Switch(
                        activeColor: Colors.white,
                        value: false,
                        onChanged: (_) {
                          setState(() {});
                        }),
                  ),
                  ListTile(
                    title: const Text("Disable text animation"),
                    subtitle: const Text(
                        "Turn off text animation in the main section"),
                    trailing: Switch(
                        activeColor: Colors.white,
                        value: true,
                        onChanged: (_) {
                          setState(() {});
                        }),
                  ),
                  ListTile(
                    title: const Text("Leave the screen on"),
                    subtitle: const Text(
                        "Disable sleep mode while the application is running"),
                    trailing: Switch(
                        activeColor: Colors.white,
                        value: true,
                        onChanged: (_) {
                          setState(() {});
                        }),
                  ),
                  ListTile(
                    title: const Text("Turn off the vibration"),
                    trailing: Switch(
                        activeColor: Colors.white,
                        value: true,
                        onChanged: (_) {
                          setState(() {});
                        }),
                  ),
                  ListTile(
                    title: const Text("Hide status bar"),
                    trailing: Switch(
                        activeColor: Colors.white,
                        value: true,
                        onChanged: (_) {
                          setState(() {});
                        }),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.info,
                      ),
                      Text("About"),
                    ],
                  ),
                ],
              ),
              Container(
                child: GridView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  children: List.generate(
                    10,
                    (index) => Image.asset(
                      "assets/themes/theme${index + 1}.jpg",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
