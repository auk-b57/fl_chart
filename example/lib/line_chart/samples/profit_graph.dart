import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProfitGraph extends StatefulWidget {
  const ProfitGraph({Key? key}) : super(key: key);

  @override
  State<ProfitGraph> createState() => _ProfitGraphState();
}

class _ProfitGraphState extends State<ProfitGraph> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(30),
      height: 150,
      width: 160,
      child: LineChart(
        mainData(),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 2,
            dashArray: [5, 5],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: -1,
      maxX: 6,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0),
            FlSpot(1, 3),
            FlSpot(2, 2),
            FlSpot(3, 4),
            FlSpot(4, 2.5),
            FlSpot(5, 7),
          ],
          color: Colors.orange,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) => index == 5
                ? FlDotCirclePainter(
                    radius: 3,
                    strokeWidth: 5,
                    strokeColor: Colors.orange,
                    color: Colors.white,
                    shadowRadius: 15,
                    shadowSpread: 30,
                  )
                : FlDotCirclePainter(
                    radius: 0,
                    strokeWidth: 0,
                  ),
          ),
        ),
      ],
    );
  }
}
