class WeekdayWeatherModel {
  String? weekDayShort;
  String? tempDay;
  String? tempNight;
  String? description;
  String? precipitation;

  WeekdayWeatherModel(
      {this.weekDayShort,
      this.tempDay,
      this.tempNight,
      this.description,
      this.precipitation});

  factory WeekdayWeatherModel.fromJson(Map<String, String> json) =>
      WeekdayWeatherModel(
          weekDayShort: json["WeekdayShortName"],
          tempDay: json["tempDay"],
          tempNight: json["tempNight"],
          description: json["description"],
          precipitation: json["precipitation"]);

  Map<String, String> toJson() => {
        "WeekdayShortName": weekDayShort ?? "",
        "tempDay": tempDay ?? "",
        "tempNight": tempNight ?? "",
        "description": description ?? "",
        "precipitation": precipitation ?? ""
      };
}
