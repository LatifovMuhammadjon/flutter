import 'package:flutter/material.dart';
import 'package:myapp3/constants.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  final List<String> continents = [
    "Europe",
    "Asia",
    "Africa",
    "America",
    "Australia"
  ];
  late String selectedContinent;
  Map<String, List<String>> countries = {
    "Europe": ["Spain", "Russia", "France", "Germany", "UK", "Italy"],
    "Asia": ["India", "China", "Japan", "South Korea", "Turkey"],
    "Australia": ["Australia", "New Zealand"],
    "Africa": ["Egypt", "South Africa", "Marocco"],
    "America": ["Canada", "USA", "Mexico", "Brazil", "Argentina"]
  };
  Map<String, String> capitals = {
    "Spain": "Madrid",
    "Russia": "Moscow",
    "France": "Paris",
    "Germany": "Berlin",
    "UK": "London",
    "Italy": "Rome",
    "India": "New Delhi",
    "China": "Beijing",
    "Japan": "Tokyo",
    "South Korea": "Seoul",
    "Turkey": "Ankara",
    "Australia": "Canberra",
    "New Zealand": "Wellington",
    "Egypt": "Cairo",
    "South Africa": "Cape Town",
    "Marocco": "Rabat",
    "Canada": "Ottawa",
    "USA": "Washington",
    "Mexico": "Mexico City",
    "Brazil": "Brasilia",
    "Argentina": "Buenos Aires"
  };
  late String selectedCountry;
  @override
  void initState() {
    super.initState();
    selectedContinent = continents.first;
    selectedCountry = countries[selectedContinent]!.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  dropdownColor: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                  value: selectedContinent,
                  onChanged: (value) => setState(() {
                    selectedContinent = value!;
                    selectedCountry = countries[value]!.first;
                  }),
                  items: continents.map(buildContinent).toList(),
                ),
              ),
            ),
            Center(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                dropdownColor: Colors.green,
                borderRadius: BorderRadius.circular(16),
                value: selectedCountry,
                onChanged: (value) => setState(() {
                  selectedCountry = value!;
                }),
                items: countries[selectedContinent]!.map(buildCountry).toList(),
              ),
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    content: Text(capitals[selectedCountry]!+" is capital of " + selectedCountry),
                    actions: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "OK",
                          style: kTextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                capitals[selectedCountry]!,
                style: kTextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildContinent(String e) => DropdownMenuItem(
      value: e,
      child: Text(
        e,
        style: kTextStyle(color: Colors.white),
      ));
  DropdownMenuItem<String> buildCountry(String e) => DropdownMenuItem(
      value: e,
      child: Text(
        e,
        style: kTextStyle(color: Colors.white),
      ));
}
