import "dart:io";
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
// import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weekday_weather_model.dart';
import "constants.dart";

String status = "Updating";
List<WeekdayWeatherModel> weekdayInfoList = [];
Future<bool?> loadData(String location, BuildContext context) async {
  try {
    status = "Updating";
    var response = await http.get(Uri.parse("https://pogoda.uz/$location"));
    List<WeekdayWeatherModel> list = [];
    if (response.statusCode == 200) {
      var document = parse(response.body);
      String mainSelector = ".weather-table tr~tr";
      for (var i = 0; i < document.querySelectorAll(mainSelector).length; i++) {
        var weekDayShort = document
            .querySelectorAll(".weather-row-day-short strong")[i]
            .innerHtml;

        var tempday = document.querySelectorAll(".forecast-day")[i].innerHtml;
        var tempnight =
            document.querySelectorAll(".forecast-night")[i].innerHtml;
        var description =
            document.querySelectorAll(".weather-row-desc")[i].innerHtml;
        var precipitation =
            document.querySelectorAll("tr~tr .weather-row-pop")[i].innerHtml;
        var model = WeekdayWeatherModel(
            weekDayShort: weekDayShort,
            tempDay: tempday,
            tempNight: tempnight,
            description: description,
            precipitation: precipitation);
        list.add(model);
        status = "Updated";
        weekdayInfoList = list;
      }
      return true;
    } else {
      showMessage("Unknown Error", context);
    }
  } on SocketException {
    showMessage('Connection error', context);
  } catch (e) {
    showMessage(e.toString(), context);
  }
  return null;
}

showMessage(String text, BuildContext context, {bool isError = true}) {
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
