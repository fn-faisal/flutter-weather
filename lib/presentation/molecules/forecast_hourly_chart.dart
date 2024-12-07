import 'package:flutter/material.dart';
import 'package:weather_app/utils/sizes.dart';
import 'package:fl_chart/fl_chart.dart';

class ForecastHourlyChart extends StatelessWidget {
  const ForecastHourlyChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data: Hourly temperature forecast (time in hours, temp in °C)
    final List<Map<String, dynamic>> hourlyData = [
      {"time": "6 AM", "temp": 15},
      {"time": "7 AM", "temp": 16},
      {"time": "8 AM", "temp": 18},
      {"time": "9 AM", "temp": 20},
      {"time": "10 AM", "temp": 22},
      {"time": "11 AM", "temp": 23},
      {"time": "12 PM", "temp": 24},
      // {"time": "1 PM", "temp": 25},
      // {"time": "2 PM", "temp": 26},
      // {"time": "3 PM", "temp": 27},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hourly Weather Forecast",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1.75,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(
                show: true,
                drawHorizontalLine: false,
                drawVerticalLine: false
              ),
              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false
                  )
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  )
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      String message = hourlyData[index]["temp"].toString();
                      return Text(message);
                    },
                  )
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      String message = "";
                      if (index >= 0 && index < hourlyData.length) {
                        message = hourlyData[index]["time"];
                      }
                      return Text(message);
                    },
                  )
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: hourlyData
                      .asMap()
                      .entries
                      .map((e) => FlSpot(
                            e.key.toDouble(),
                            e.value["temp"].toDouble(),
                          ))
                      .toList(),
                  isCurved: true,
                  // colors: [Colors.blue],
                  barWidth: 4,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.5),
                        Colors.blue.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}