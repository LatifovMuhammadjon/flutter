import 'dart:math';

import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

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
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animRotate = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addListener(
        () => setState(() {}),
      );
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: vw / 20,
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: vw,
                height: vh - 56,
                color: Colors.green,
              ),
              AnimatedBuilder(
                  animation: animRotate,
                  child: Container(
                    
                    width: vw,
                    height: 300,
                    color: Colors.red,
                    child: ListView(children: [
                      Container(height: 200,
                      width: double.infinity,
                      color: Colors.white,),
                      Container(height: 200,
                      width: double.infinity,
                      color: Colors.blue,),
                      Container(height: 200,
                      width: double.infinity,
                      color: Colors.blueGrey,),
                    ]),
                  ),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, -300+animRotate.value),
                      child: child,
                    );
                  }),
              // AnimatedBuilder(
              //   animation: animRotate,
              //   child: Container(
              //     height: vw/5,
              //     width: vw/5,
              //     decoration: BoxDecoration(
              //       color: Colors.green,
              //       borderRadius: BorderRadius.circular(vw/10),
              //     ),
              //   ),
              //   builder: (context, child) => Transform.translate(
              //     offset: Offset(0,0),
              //     child: child,
              //   ),
              // ),
              // AnimatedBuilder(
              //   animation: animRotate,
              //   child: Container(
              //     height: vw/5,
              //     width: vw/5,
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //       borderRadius: BorderRadius.circular(vw/10),
              //     ),
              //   ),
              //   builder: (context, child) => Transform.translate(
              //     offset: Offset(-vw*3*cos(animRotate.value)/10,vw*3*sin(animRotate.value)/10),
              //     child: child,
              //   ),
              // ),

              // AnimatedBuilder(
              //   animation: animRotate,
              //   child: Container(
              //     height: vw/5,
              //     width: vw/5,
              //     decoration: BoxDecoration(
              //       color: Colors.blue,
              //       borderRadius: BorderRadius.circular(vw/10),
              //     ),
              //   ),
              //   builder: (context, child) => Transform.translate(
              //     offset: Offset(vw*3/10,0),
              //     child: child,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          animationController.forward();
        });
      }),
    );
  }
}
