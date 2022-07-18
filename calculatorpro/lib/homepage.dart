import 'package:calculatorpro/contants.dart';
import 'package:calculatorpro/utils.dart';
import 'package:flutter/material.dart';

Widget homepage(BuildContext context, Size size) => Container(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: TabBarView(
          children: [
            Column(
              children: [
                Column(
                  children: <Widget>[
                    const Align(
                      child: Text("Muhammadjon"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          showGeneralDialog(
      context: context,
      barrierDismissible: true,
      // transitionDuration: Duration(milliseconds: 500),
      barrierLabel: 
      MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Card(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () => Navigator.of(context).pop('item1'),
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () => Navigator.of(context).pop('item2'),
                    ),
                    ListTile(
                      title: Text('Item 3'),
                      onTap: () => Navigator.of(context).pop('item3'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
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
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics(),),
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
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.red,
            ),
          ],
        ),
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
