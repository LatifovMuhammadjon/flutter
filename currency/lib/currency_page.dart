import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main.dart';
import 'utils.dart';
import 'currency_model.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final TextEditingController textEditingController = TextEditingController();
  List<CurrencyModel> list = [];

  @override
  void initState() {
    super.initState();
    list = listCurrency;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2235),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    list = listCurrency
                        .where((value) => value.fullName!
                            .toLowerCase()
                            .startsWith(
                                textEditingController.text.toLowerCase()))
                        .toList();
                    listCurrency.forEach(
                      (element) => print(element.fullName),
                    );
                  });
                },
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  fillColor: const Color(0xff2d334d),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  hintText: 'Search',
                  hintStyle: kTextStyle(
                      color: Colors.white54,
                      size: 16,
                      fontWeight: FontWeight.w500),
                  suffixIcon: IconButton(
                      onPressed: () {
                        textEditingController.clear();
                        setState(() {
                          list.clear();
                          list.addAll(listCurrency);
                        });
                      },
                      icon: const Icon(Icons.clear,
                          color: Colors.white, size: 20)),
                ),
              ),
            ),
            content(list),
          ],
        ),
      ),
    );
  }

  Expanded content(List<CurrencyModel> list) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: const Color(0xff2d334d),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              list.length,
              (index) => InkWell(
                onTap: () {
                  Navigator.of(context)..pop(list[index]);
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/flags/${list[index].name.toString().substring(0, 2).toLowerCase()}.svg',
                    width: 25,
                    height: 25,
                  ),
                  subtitle: Text(
                    '${list[index].fullName}',
                    style: kTextStyle(),
                  ),
                  title: Text(
                    '${list[index].name}',
                    style: kTextStyle(),
                  ),
                  trailing: Text(
                    '${list[index].price}',
                    style: kTextStyle(),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
