import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/index_change_provider.dart';
import 'package:testapp/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexChanger()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          pages[context.watch<IndexChanger>().index],
        ),
      ),
      
      body: IndexedStack(
        index: context.watch<IndexChanger>().index,
        children: List.generate(
          pages.length,
          (index) => Text(pages[index], 
          style: TextStyle(color: Colors.indigo),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => context.read<IndexChanger>().changeIndex(index),
        currentIndex: context.watch<IndexChanger>().index,
        backgroundColor: Colors.indigo,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.indigo[300],
        items: List.generate(
          pages.length,
          (index) => bottomNavigationBarItem(index),
        ),
      ),
    );
  }
}

BottomNavigationBarItem bottomNavigationBarItem(int index) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.indigo,
    icon: Icon(
      bottomNavigationBarIcons[index],
    ),
    label: pages[index],
  );
}
