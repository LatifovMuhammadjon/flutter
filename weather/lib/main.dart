// import "dart:io";
import 'package:flutter/material.dart';
// import 'package:weather/constants.dart';
// import 'package:html/parser.dart' show parse;
// // import 'package:html/dom.dart';
// import 'package:http/http.dart' as http;
// import 'package:weather/weekday_weather_model.dart';
// import 'package:weather/load_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/weather_page.dart';
import 'package:weather/models/weekly_model.dart';

void main(List<String> args) async{
await Hive.initFlutter();
  Hive.registerAdapter<WeatherModel>(WeatherModelAdapter());
  Hive.registerAdapter<WeeklyModel>(WeeklyModelAdapter());
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WeatherPage(),
  ));
}

// class WeatherPage extends StatefulWidget {
//   const WeatherPage({Key? key}) : super(key: key);

//   @override
//   State<WeatherPage> createState() => _WeatherPageState();
// }

// class _WeatherPageState extends State<WeatherPage> {
//   final Color textColor1 = const Color(0xff25272E);
//   final Color textColor2 = const Color(0xffCBCBCB);

//   int? activeIndex;
//   @override
//   void initState() {
//     super.initState();
//     activeIndex = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: scaffoldWeatherGradient,
//         ),
//         child: FutureBuilder(
//           builder: ((ctx, snapshot) {
//             if (snapshot.hasData) {
//               return SafeArea(
//                 child: Column(
//                   children: [
//                     CustomAppBar(textColor1: textColor1),
//                     Flexible(
//                       child: ListView(
//                         physics: BouncingScrollPhysics(),
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         shrinkWrap: true,
//                         children: [
//                           const WaetherMainBox(),
//                           WeatherInfoBox(
//                               textColor1: textColor1, textColor2: textColor2),
//                           Text(
//                             'Недельный прогноз',
//                             style: kTextStyle(
//                                 color: textColor1,
//                                 fontWeight: FontWeight.bold,
//                                 size: 22),
//                           ),
//                           Container(
//                             height: 250,
//                             width: double.infinity,
//                             child: ListView(
//                               physics: BouncingScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               padding: const EdgeInsets.symmetric(vertical: 25),
//                               shrinkWrap: true,
//                               children: List.generate(
//                                 weekdayInfoList.length,
//                                 (index) => WeeklyItem(
//                                   isActive: index == (activeIndex ?? 0),
//                                   textColor1: textColor1,
//                                   textColor2: textColor2,
//                                   model: weekdayInfoList[index],
//                                   onClick: () {
//                                     setState(() {
//                                       activeIndex = index;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               showMessage("Error", context);
//               return Center();
//             } else {
//               return CircularProgressIndicator();
//             }
//           }),
//           future: loadData("tashkent", context),
//         ),
//       ),
//     );
//   }
// }

// class WeeklyItem extends StatelessWidget {
//   WeeklyItem({
//     required this.isActive,
//     required this.textColor1,
//     required this.textColor2,
//     required this.model,
//     required this.onClick,
//     Key? key,
//   }) : super(key: key);

//   bool isActive = false;
//   final Color textColor1;
//   final Color textColor2;
//   WeekdayWeatherModel model;
//   void Function()? onClick;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onClick,
//       child: Container(
//         width: 70,
//         padding: const EdgeInsets.all(15),
//         margin: const EdgeInsets.only(right: 20),
//         decoration: BoxDecoration(
//           gradient: isActive ? containerWeatherGradient : null,
//           borderRadius: BorderRadius.circular(35),
//           boxShadow: isActive
//               ? [
//                   BoxShadow(
//                     color: const Color(0xff5F68ED).withOpacity(0.4),
//                     blurRadius: 20,
//                     offset: const Offset(2, 4),
//                   ),
//                 ]
//               : null,
//         ),
//         child: Column(
//           children: [
//             Text(
//               model.weekDayShort!,
//               style: kTextStyle(
//                   size: 12,
//                   color: isActive ? null : textColor1,
//                   fontWeight: FontWeight.w700),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               '03 Июл',
//               style: kTextStyle(
//                   size: 10,
//                   color: isActive ? null : textColor2,
//                   fontWeight: FontWeight.w500),
//             ),
//             Expanded(
//               child: Image.asset(
//                 'assets/ic_mist.png',
//                 height: 40,
//                 width: 40,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10, left: 3),
//               child: Text(
//                 model.tempDay!,
//                 style: kTextStyle(
//                     size: 20,
//                     color: isActive ? null : textColor1,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//               alignment: Alignment.center,
//               constraints: const BoxConstraints(
//                 minWidth: 30,
//               ),
//               decoration: BoxDecoration(
//                 color: const Color(0xff2DBE8D),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 '${model.precipitation}%',
//                 style: kTextStyle(size: 10, fontWeight: FontWeight.w700),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class WeatherInfoBox extends StatelessWidget {
//   const WeatherInfoBox({
//     Key? key,
//     required this.textColor1,
//     required this.textColor2,
//   }) : super(key: key);

//   final Color textColor1;
//   final Color textColor2;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       margin: const EdgeInsets.symmetric(vertical: 25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xff555555).withOpacity(0.05),
//             blurRadius: 30,
//             offset: const Offset(5, 15),
//           )
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Image.asset(
//                 'assets/water.png',
//                 height: 30,
//                 width: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Text(
//                   'Качество воздуха',
//                   style: kTextStyle(
//                       color: textColor1, size: 18, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               const Spacer(),
//               InkWell(
//                 onTap: () {},
//                 borderRadius: BorderRadius.circular(25),
//                 child: Container(
//                   height: 35,
//                   width: 35,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xff9A60E5).withOpacity(0.16),
//                         blurRadius: 30,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Image.asset(
//                     'assets/ic_refresh.png',
//                     height: 20,
//                     width: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15, bottom: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InfoItem(
//                   textColor2: textColor2,
//                   textColor1: textColor1,
//                   icon: 'pess',
//                   title: 'Давление',
//                   subTitle: '753 мм рт. ст.',
//                 ),
//                 InfoItem(
//                   textColor2: textColor2,
//                   textColor1: textColor1,
//                   icon: 'wind',
//                   title: 'Ветер',
//                   subTitle: 'ЗСЗ, 5.4 м/c',
//                 ),
//                 InfoItem(
//                   textColor2: textColor2,
//                   textColor1: textColor1,
//                   icon: 'sun',
//                   title: 'Восход',
//                   subTitle: '04:46',
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InfoItem(
//                 textColor2: textColor2,
//                 textColor1: textColor1,
//                 icon: 'moon',
//                 title: 'Луна',
//                 subTitle: 'Растущая Луна',
//               ),
//               InfoItem(
//                 textColor2: textColor2,
//                 textColor1: textColor1,
//                 icon: 'rain',
//                 title: 'Влажность',
//                 subTitle: '10%',
//               ),
//               InfoItem(
//                 textColor2: textColor2,
//                 textColor1: textColor1,
//                 icon: 'sunset',
//                 title: 'Закат',
//                 subTitle: '19:46',
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class InfoItem extends StatelessWidget {
//   const InfoItem(
//       {Key? key,
//       required this.textColor2,
//       required this.textColor1,
//       required this.icon,
//       required this.title,
//       required this.subTitle})
//       : super(key: key);

//   final Color textColor2;
//   final Color textColor1;
//   final String icon;
//   final String title;
//   final String subTitle;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.asset(
//           'assets/$icon.png',
//           height: 25,
//           width: 25,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: kTextStyle(
//                   size: 10, fontWeight: FontWeight.w700, color: textColor2),
//             ),
//             Text(
//               subTitle,
//               style: kTextStyle(
//                   size: 10, fontWeight: FontWeight.bold, color: textColor1),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

// class WaetherMainBox extends StatelessWidget {
//   const WaetherMainBox({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           margin: const EdgeInsets.only(top: 30),
//           decoration: BoxDecoration(
//             gradient: containerWeatherGradient,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xff5264F0).withOpacity(0.31),
//                 blurRadius: 30,
//                 offset: const Offset(10, 15),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 116),
//                 child: Text(
//                   'Ясно',
//                   style: kTextStyle(size: 24, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   GradientText(
//                     '+21°',
//                     style: kTextStyle(size: 55, fontWeight: FontWeight.bold),
//                     gradient: textWeatherGradient,
//                   ),
//                   Text(
//                     'Очищается 26°',
//                     style: kTextStyle(size: 15, fontWeight: FontWeight.w500),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           left: 20,
//           child: Image.asset(
//             'assets/ic_rain.png',
//             height: 160,
//             width: 160,
//           ),
//         ),
//         Positioned(
//           top: 50,
//           right: 20,
//           child: Text(
//             'Сегодня\n2 июля',
//             style: kTextStyle(size: 16, fontWeight: FontWeight.w500),
//             textAlign: TextAlign.end,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({
//     Key? key,
//     required this.textColor1,
//   }) : super(key: key);

//   final Color textColor1;

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   String? _value;
//   @override
//   void initState() {
//     _value = locations.first;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             onTap: () {},
//             borderRadius: BorderRadius.circular(25),
//             child: Container(
//               height: 50,
//               width: 50,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xff9A60E5).withOpacity(0.16),
//                     blurRadius: 30,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Image.asset(
//                 'assets/ic_settings.png',
//                 height: 20,
//                 width: 20,
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Row(
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/ic_location.png',
//                     height: 20,
//                     width: 20,
//                   ),
//                   DropdownButton(
//                       value: _value,
//                       items: List.generate(
//                         locations.length,
//                         (index) => DropdownMenuItem<String>(
//                           value: locations[index],
//                           child: Text(
//                             locations[index],
//                             style: kTextStyle(
//                               color: widget.textColor1,
//                               size: 20,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                       ),

//                       // locations
//                       //     .map(
//                       //       (e) => DropdownMenuItem<String>(
//                       //         value: e,
//                       //         child: Text(
//                       //           e,
//                       //           style: kTextStyle(
//                       //             color: widget.textColor1,
//                       //             size: 20,
//                       //             fontWeight: FontWeight.w700,
//                       //           ),
//                       //         ),
//                       //       ),
//                       //     )
//                       //     .toList(),
//                       onChanged: (item) {
//                         setState(() {
//                           _value = item as String?;
//                           loadData(_value!, context)
//                               .whenComplete(() => setState(
//                                     () {
//                                       status = "Updated";
//                                     },
//                                   ));
//                         });
//                       }),
//                 ],
//               ),
//               // TextButton.icon(
//               //   onPressed: () {},
//               //   icon: Image.asset(
//               //     'assets/ic_location.png',
//               //     height: 20,
//               //     width: 20,
//               //   ),
//               //   label: Text(
//               //     'Фергана',
//               //     style: kTextStyle(
//               //         color: widget.textColor1,
//               //         size: 20,
//               //         fontWeight: FontWeight.w700),
//               //   ),
//               // ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 decoration: BoxDecoration(
//                   gradient: containerWeatherGradient,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   status,
//                   style: kTextStyle(size: 12),
//                 ),
//               )
//             ],
//           ),
//           InkWell(
//             onTap: () {},
//             borderRadius: BorderRadius.circular(25),
//             child: Container(
//               height: 50,
//               width: 50,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//                 border: Border.all(color: Colors.white, width: 2),
//                 image: const DecorationImage(
//                     image: AssetImage('assets/img_ava.png'), fit: BoxFit.cover),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xff9A60E5).withOpacity(0.16),
//                     blurRadius: 30,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
