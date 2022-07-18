import 'package:flutter/material.dart';

class MeasureTabs extends StatefulWidget {
  MeasureTabModel model;
  MeasureTabs({Key? key, required this.model}) : super(key: key);
  @override
  State<MeasureTabs> createState() {
    return _MeasureTabsState(model);
  }
}

class _MeasureTabsState extends State<MeasureTabs> {
  late MeasureTabModel model;
  _MeasureTabsState(this.model);
  var value;
  late bool isChanged;
  bool isVisible = true;
  @override
  void initState() {
    value = model.measures.first;
    isChanged = true;
    isVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.measures[0].name,
                      style: const TextStyle(color: Colors.black),
                    ),
                    ExpansionTile(
                      onExpansionChanged: (isChanged) {
                        setState(() {
                          isChanged = !isChanged;
                          isVisible = !isVisible;
                        });
                      },
                      title: Text(
                        model.measures[0].shortName,
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: const Icon(Icons.expand_more),
                      children: List.generate(
                        model.measures.length,
                        (index) => listTile(model.measures[index]),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 2,
                child: TextField(
                  minLines: 1,
                  maxLines: 4,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Visibility(
            visible: isVisible,
            child: ListView(
              children: List.generate(
                model.measures.length,
                (index) => ListTile(
                  title: Text(model.measures[index].shortName),
                  subtitle: Text(model.measures[index].name),
                  trailing: Text("${model.measures[index].value}"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MeasureModel {
  String name, shortName;
  num value;
  MeasureModel(
      {required this.name, required this.shortName, required this.value});
}

class MeasureTabModel {
  String tabName;
  List<MeasureModel> measures;
  MeasureTabModel({required this.tabName, required this.measures});
}

Widget listTile(MeasureModel model) {
  return Container(
    child: Row(
      children: [
        Column(
          children: [
            Text(model.shortName),
            Text(model.name),
          ],
        ),
        const Spacer(),
        Text("${model.value}"),
      ],
    ),
  );
}
