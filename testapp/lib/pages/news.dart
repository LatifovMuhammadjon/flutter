import 'package:flutter/material.dart';
import 'package:testapp/utils/utils.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("title"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
          items: List.generate(
          
        4,
        (index) => BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
            
            },
            icon: Icon(
              bottomNavigationBarIcons[index],
            ),
          ),
          label: pages[index],
          backgroundColor: Colors.indigo,
        ),
      )),
    );
  }
}
