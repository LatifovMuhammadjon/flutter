import 'dart:convert';
import 'dart:io';
import 'package:currency/currency_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as dom;
import 'utils.dart';
import 'currency_model.dart';

// import 'package:lesson1/utils/constants.dart';
// import 'package:lesson1/utils/routes.dart';
void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: ComparePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ComparePage extends StatefulWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  State<ComparePage> createState() => _ComparePageState();
}

final List<CurrencyModel> listCurrency = [];
CurrencyModel? topCur;
CurrencyModel? bottomCur;

class _ComparePageState extends State<ComparePage> {
  final TextEditingController _editingControllerTop = TextEditingController();
  final TextEditingController _editingControllerBottom =
      TextEditingController();
  final FocusNode _topFocus = FocusNode();
  final FocusNode _bottomFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _editingControllerTop.addListener(() {
      if (_topFocus.hasFocus) {
        setState(() {
          if (_editingControllerTop.text.isNotEmpty) {
            double sum = (topCur?.price ?? 0) /
                (bottomCur?.price ?? 0) *
                double.parse(_editingControllerTop.text);
            _editingControllerBottom.text = sum.toStringAsFixed(2);
          } else {
            _editingControllerBottom.clear();
          }
        });
      }
    });
    _editingControllerBottom.addListener(() {
      if (_bottomFocus.hasFocus) {
        setState(() {
          if (_editingControllerBottom.text.isNotEmpty) {
            double sum = bottomCur?.price ?? 0 /
                (topCur?.price ?? 0) *
                double.parse(_editingControllerBottom.text);
            _editingControllerTop.text = sum.toStringAsFixed(2);
          } else {
            _editingControllerTop.clear();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _editingControllerTop.dispose();
    _editingControllerBottom.dispose();
    _topFocus.dispose();
    _bottomFocus.dispose();
    super.dispose();
  }

  Future<bool?> _loadData() async {
    try {
      var response =
          await get(Uri.parse("https://pokur.su/usd"));
      if (response.statusCode == 200) {
      var document = parse(response.body);
      var flags = document.querySelectorAll("#w0 td img");
      var data = document.querySelectorAll("#w0 tr td a");
      String? fullName, name, path;
      double? price;
      for (var i = 0; i < flags.length; i++) {
        if (i.isEven) {
          fullName = data[i].innerHtml;
          name = data[i]
              .attributes["href"]
              .toString()
              .replaceAll("/", "")
              .toUpperCase();
          path = flags[i ~/ 2].attributes["src"].toString().substring(7);
        } else {
          price = double.parse(data[i]
              .innerHtml
              .toString()
              .replaceAll(" ", "")
              .replaceAll(",", "."));

          listCurrency.add(CurrencyModel(
              fullName: fullName, name: name, price: price, pathIcon: path));
        }
      }
        // for (final item in jsonDecode(response.body)) {
        //   var model = CurrencyModel.fromJson(item);
        //   if (model. == 'USD') {
        //     topCur = model;
        //   } else if (model.ccy == 'RUB') {
        //     bottomCur = model;
        //   }
        //   listCurrency.add(model);
        // }
        return true;
      } else {
        _showMessage('Unknown error');
      }
    } on SocketException {
      _showMessage('Connection error');
    } catch (e) {
      _showMessage(e.toString());
    }
    return null;
  }

  _showMessage(String text, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green[400],
        content: Text(
          text,
          style: kTextStyle(size: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1f2235),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hello Baxtiyor,\n',
                      style: kTextStyle(size: 16),
                      children: [
                        TextSpan(
                          text: 'Wellcome Back',
                          style:
                              kTextStyle(size: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white12),
                      ),
                      child: const Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              FutureBuilder(
                  future: listCurrency.isEmpty ? _loadData() : null,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          color: const Color(0xff2d334d),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Exchange',
                                  style: kTextStyle(
                                      size: 16, fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.settings,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  children: [
                                    _itemExch(_editingControllerTop, topCur,
                                        _topFocus, true),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    _itemExch(_editingControllerBottom,
                                        bottomCur, _bottomFocus, false),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      var model = topCur?.copyWith();
                                      topCur = bottomCur?.copyWith();
                                      bottomCur = model;
                                      _editingControllerTop.clear();
                                      _editingControllerBottom.clear();
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff2d334d),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white12),
                                    ),
                                    child: const Icon(
                                      Icons.currency_exchange,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'Error',
                            style: kTextStyle(size: 18),
                          ),
                        ),
                      );
                    } else {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemExch(TextEditingController controller, CurrencyModel? model,
      FocusNode focusNode, bool isTop) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: kTextStyle(size: 24, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: '0.00',
                    hintStyle:
                        kTextStyle(size: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                // onTap: () => Navigator.pushNamed(context, Routes.currencyPage),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: ((context) => const CurrencyPage())))
                    .then((value) {
                  if (value is CurrencyModel) {
                    setState(() {
                      if (isTop) {
                        topCur = value;
                      } else {
                        bottomCur = value;
                      }
                    });
                  }
                }),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff10a4d4)),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SvgPicture.asset(
                        'assets/flags/${model?.pathIcon}.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: Text(
                        model?.name ?? 'UNK',
                        style:
                            kTextStyle(size: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white54,
                      size: 15,
                    )
                  ]),
                ),
              )
            ],
          ),
          Text(
            controller.text.isNotEmpty
                ? (double.parse(controller.text) * 0.05).toStringAsFixed(2)
                : '0.00',
            style:
                kTextStyle(fontWeight: FontWeight.w600, color: Colors.white54),
          )
        ],
      ),
    );
  }
}
