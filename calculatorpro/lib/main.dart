import 'package:calculatorpro/contants.dart';
import 'package:calculatorpro/currency_page.dart';
import 'package:calculatorpro/history.dart';
import 'package:calculatorpro/measurepage.dart';
import 'package:calculatorpro/settings_page.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawerEnableOpenDragGesture: true,
        endDrawer: Drawer(
          width: size.width,
        ),
        drawer: Drawer(
          width: size.width * .7,
          elevation: 0,
          backgroundColor: Colors.grey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: GridView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: const Text(
                      "More themes...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: bodyBgColor,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: iconActiveColor,
          ),
          actionsIconTheme: IconThemeData(
            color: iconActiveColor,
          ),
          backgroundColor: appBarBgColor,
          title: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: iconActiveColor,
              tabs: const [
                Tab(
                  icon: Icon(Icons.calculate_outlined),
                ),
                Tab(
                  icon: Icon(
                    Icons.currency_exchange_outlined,
                  ),
                ),
                Tab(
                  icon: Icon(Icons.calculate_outlined),
                ),
              ]),
          actions: [
            IconButton(
              color: iconActiveColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const SettingPage())));
              },
              icon: const Icon(
                Icons.settings_outlined,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            const MyHomePage(),
            const CurrencyPage(),
            DefaultTabController(
              length: measureTabModelList.length,
              child: Scaffold(
                appBar: TabBar(
                  labelColor: iconActiveColor,
                  isScrollable: true,
                  tabs: List.generate(
                    measureTabModelList.length,
                    (index) => Tab(
                      text: measureTabModelList[index].tabName,
                    ),
                  ),
                ),
                body: TabBarView(
                  children: List.generate(
                    measureTabModelList.length,
                    (index) => MeasureTabs(model: measureTabModelList[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
