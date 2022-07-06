import 'package:html/parser.dart' show parse;
// import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import "constants.dart";

void main() async {
  var response = await http.get(Uri.parse("https://pogoda.uz/${locations[2]}"));
  if (response.statusCode == 200) {
    var document = parse(response.body);
    String mainSelector = ".weather-table tr~tr";
    for (var i = 0; i < document.querySelectorAll(mainSelector).length; i++) {
      var weekDayShort = document
          .querySelectorAll(".weather-row-day-short strong")[i]
          .innerHtml;
      // print(weekDayShort);
      var tempday = document.querySelectorAll(".forecast-day")[i].innerHtml;
      var tempnight = document.querySelectorAll(".forecast-night")[i].innerHtml;
      var description = document.querySelectorAll(".weather-row-desc")[i].innerHtml;
      var precipitation = document.querySelectorAll(".weather-row-pop")[i].innerHtml;
      
    }
  }
}
