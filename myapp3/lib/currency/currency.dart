import 'package:flutter/material.dart';
import 'package:myapp3/constants.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2235),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: const Color(0xff2d334d),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Exchange",
                  style: kTextStyle(size: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _itemExch(),
                    _itemExch(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _itemExch() {
    return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white12,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  hintText: '0.00',
                                  hintStyle: kTextStyle(
                                    size: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xff10a4d4),
                              ),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/avatar.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      "UZS",
                                      style: kTextStyle(
                                        size: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Colors.white54,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "0.00",
                          style: kTextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  );
  }
}
