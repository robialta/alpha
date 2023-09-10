// import 'package:alpha/common/constant/colors.dart';
// import 'package:alpha/common/constant/images.dart';
// import 'package:alpha/common/constant/styles.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// LineChartData chart(bool isHomePage, List<FlSpot> spots, double minY,
//     double maxY, double minX, double maxX, BuildContext context) {
//   return LineChartData(
//     backgroundColor: grey100,
//     borderData: FlBorderData(border: Border.all(width: 0)),
//     gridData: FlGridData(
//       show: true,
//       drawVerticalLine: false,
//       drawHorizontalLine: false,
//     ),
//     titlesData: FlTitlesData(
//         // topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         // bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         // rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         // leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         ),
//     lineTouchData: LineTouchData(
//       getTouchedSpotIndicator: (barData, spotIndexes) =>
//           defaultTouchedIndicators(barData, spotIndexes),
//       getTouchLineEnd: (barData, spotIndex) => barData.spots[spotIndex].y * 2,
//       getTouchLineStart: (barData, spotIndex) => barData.spots[spotIndex].y,
//       touchTooltipData: LineTouchTooltipData(
//           tooltipBgColor: grey200,
//           tooltipRoundedRadius: 12,
//           showOnTopOfTheChartBoxArea: true,
//           getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
//             return touchedBarSpots.map((barSpot) {
//               final flSpot = barSpot;
//               return LineTooltipItem('Sep 27, 2022', caption1(color: grey600),
//                   children: [
//                     TextSpan(
//                       text: ' ',
//                       style: headline(color: grey1100),
//                     ),
//                     TextSpan(
//                       text:
//                           '\$${flSpot.y.toStringAsFixed(2).replaceFirst(',', '.').replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',')}',
//                       style: headline(color: grey1100),
//                     ),
//                   ]);
//             }).toList();
//           }),
//     ),
//     minX: minX,
//     maxX: maxX,
//     minY: minY,
//     maxY: maxY,
//     lineBarsData: [
//       LineChartBarData(
//         spots: spots,
//         isCurved: true,
//         // color: green,
//         barWidth: 2,
//         isStrokeCapRound: true,
//         dotData: FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//           show: true,
//           // gradient: LinearGradient(
//           //   begin: Alignment.topCenter,
//           //   end: Alignment.bottomCenter,
//           //   colors: [
//           //     const Color(0xFF00CD50).withOpacity(0.5),
//           //     const Color(0xFF00CD50).withOpacity(0),
//           //   ],
//           // ),
//         ),
//       ),
//     ],
//   );
// }

// Widget chartSortWidget(String str, bool isSelected) {
//   return Text(
//     str,
//     style: callout(color: isSelected ? grey1100 : grey600),
//   );
// }

// List<TouchedSpotIndicatorData> defaultTouchedIndicators(
//   LineChartBarData barData,
//   List<int> indicators,
// ) {
//   return indicators.map((int index) {
//     /// Indicator Line
//     const lineStrokeWidth = 2.0;
//     final flLine =
//         FlLine(color: grey600, strokeWidth: lineStrokeWidth, dashArray: [1, 5]);

//     final dotData = FlDotData(
//       getDotPainter: (spot, percent, bar, index) =>
//           _defaultGetDotPainter(spot, percent, bar, index, size: 6),
//     );

//     return TouchedSpotIndicatorData(flLine, dotData);
//   }).toList();
// }

// FlDotPainter _defaultGetDotPainter(
//   FlSpot spot,
//   double xPercentage,
//   LineChartBarData bar,
//   int index, {
//   double? size,
// }) {
//   return FlDotCirclePainter(
//     radius: size,
//     color: green,
//     strokeColor: green,
//   );
// }

// List<FlSpot> spots = const [
//   FlSpot(0.0, 22003.6),
//   FlSpot(1.0, 22016.67),
//   FlSpot(2.0, 21978.72),
//   FlSpot(3.0, 21999.85),
//   FlSpot(4.0, 22057.55),
//   FlSpot(5.0, 22146.0),
//   FlSpot(6.0, 22165.06),
//   FlSpot(7.0, 22153.29),
//   FlSpot(8.0, 22101.37),
//   FlSpot(9.0, 22084.74),
//   FlSpot(10.0, 22022.72),
//   FlSpot(11.0, 22038.71),
//   FlSpot(12.0, 22017.77),
//   FlSpot(13.0, 22028.93),
//   FlSpot(14.0, 22007.29),
//   FlSpot(15.0, 22103.95),
//   FlSpot(16.0, 22088.48),
//   FlSpot(17.0, 22084.38),
//   FlSpot(18.0, 21987.34),
//   FlSpot(19.0, 21999.1),
//   FlSpot(20.0, 21805.81),
//   FlSpot(21.0, 21712.65),
//   FlSpot(22.0, 21707.24),
//   FlSpot(23.0, 21724.09),
//   FlSpot(24.0, 21713.64),
//   FlSpot(25.0, 21735.75),
//   FlSpot(26.0, 21736.26),
//   FlSpot(27.0, 21773.22),
//   FlSpot(28.0, 21764.93),
//   FlSpot(29.0, 21770.93),
//   FlSpot(30.0, 21755.14),
//   FlSpot(31.0, 21744.67),
//   FlSpot(32.0, 21729.9),
//   FlSpot(33.0, 21749.79),
//   FlSpot(34.0, 21745.62),
//   FlSpot(35.0, 21731.6),
//   FlSpot(36.0, 21737.21),
//   FlSpot(37.0, 21708.93),
//   FlSpot(38.0, 21642.33),
//   FlSpot(39.0, 21708.16),
//   FlSpot(40.0, 21688.01),
//   FlSpot(41.0, 21646.6),
//   FlSpot(42.0, 21644.52),
//   FlSpot(43.0, 21691.05),
//   FlSpot(44.0, 21652.56),
//   FlSpot(45.0, 21661.57),
//   FlSpot(46.0, 21649.7),
//   FlSpot(47.0, 21640.36),
//   FlSpot(48.0, 21619.37),
// ];

// List<Map<String, dynamic>> items = [
//   <String, dynamic>{
//     'title': 'Stock',
//     'icon': chartLine,
//     'balance': '\$800,000',
//     'profits': '+\$20,000',
//     'rate': '+25%',
//     'bg': green
//   },
//   <String, dynamic>{
//     'title': 'Stock',
//     'icon': cardholder,
//     'balance': '\$800,000',
//     'profits': '+\$20,000',
//     'rate': '+25%',
//     'bg': stPatricksBlue
//   },
// ];
