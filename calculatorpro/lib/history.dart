import 'package:flutter/material.dart';
import 'package:calculatorpro/contants.dart';
import 'package:calculatorpro/utils.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animRotate;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    // animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width;
    final vh = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    animRotate =
        Tween<double>(begin: 0, end: vh - 56).animate(animationController)
          ..addListener(
            () => setState(() {}),
          );
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    const Align(
                      child: Text("Muhammadjon"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            animationController.forward();
                          });
                        },
                        child: const Icon(
                          Icons.restore,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const TextField(),
                Column(
                  children: [
                    GridView.count(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      childAspectRatio: size.width * .25 / (size.height * .1),
                      children: List.generate(
                        20,
                        (index) => GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              list[index],
                              style: TextStyle(
                                  fontSize: 25, color: iconActiveColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: false,
                        enableDrag: true,
                        context: context,
                        builder: (ctx) => _buildBottomSheet(ctx, size),
                      ),
                      child: const Icon(Icons.keyboard_arrow_up),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: animRotate,
            child: Column(
              children: [
                Container(
                  height: 56,
                  color: Colors.blue,
                  // child: Row(children: [],),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.blue,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    animationController.reverse();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                    ),
                    width: double.infinity,
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                    ),
                  ),
                ),
              ],
            ),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, 56 - vh + animRotate.value),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget homepage(BuildContext context, Size size) => Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              const Align(
                child: Text("Muhammadjon"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: const Icon(
                    Icons.restore,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const TextField(),
          Column(
            children: [
              GridView.count(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                crossAxisCount: 4,
                shrinkWrap: true,
                childAspectRatio: size.width * .25 / (size.height * .1),
                children: List.generate(
                  20,
                  (index) => GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        list[index],
                        style: TextStyle(fontSize: 25, color: iconActiveColor),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  isScrollControlled: false,
                  enableDrag: true,
                  context: context,
                  builder: (ctx) => _buildBottomSheet(ctx, size),
                ),
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ],
          ),
        ],
      ),
    );
Widget _buildBottomSheet(BuildContext context, Size size) => Scaffold(
      body: Container(
        color: operationsBgColor,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.keyboard_arrow_up_sharp,
                color: iconActiveColor,
              ),
            ),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              childAspectRatio: size.width * .25 / (size.height * .1),
              children: List.generate(
                20,
                (index) => GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      list[index],
                      style: TextStyle(
                        color: iconActiveColor,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
