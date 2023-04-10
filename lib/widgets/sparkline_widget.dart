import 'package:alpha/common/constant/colors.dart';
import 'package:alpha/widgets/chart_detail.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SparklineWidget extends StatelessWidget {
  const SparklineWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: false,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (double value) {
              return FlLine(
                color: green,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (double value) {
              return FlLine(
                color: green,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
              show: false, border: Border.all(color: green, width: 1)),
          minX: 0,
          maxX: 48.0,
          minY: 21619.37,
          maxY: 22165.06,
          lineBarsData: <LineChartBarData>[
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 1,
              isStrokeCapRound: false,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: false,
              ),
            ),
          ],
        ),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}
