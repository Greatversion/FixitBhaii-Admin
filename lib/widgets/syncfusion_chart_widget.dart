import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ServiceTrendChart extends StatelessWidget {
  final List<_ChartData> data = [
    _ChartData('Mon', 14),
    _ChartData('Tue', 28),
    _ChartData('Wed', 19),
    _ChartData('Thu', 23),
    _ChartData('Fri', 31),
    _ChartData('Sat', 18),
    _ChartData('Sun', 25),
  ];

  ServiceTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: 'Weekly Service Requests'),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries>[
        ColumnSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.day,
          yValueMapper: (_ChartData data, _) => data.count,
          name: 'Services',
          color: Colors.blueAccent,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        )
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.day, this.count);
  final String day;
  final int count;
}




class SyncfusionChart extends StatelessWidget {
  const SyncfusionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Admin Analytics",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Monthly Services Count'),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              ColumnSeries<ChartData, String>(
                dataSource: [
                  ChartData('Jan', 40),
                  ChartData('Feb', 35),
                  ChartData('Mar', 50),
                  ChartData('Apr', 60),
                  ChartData('May', 30),
                ],
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.count,
                name: 'Services',
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 200,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Technician Signups'),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              LineSeries<ChartData, String>(
                dataSource: [
                  ChartData('Jan', 20),
                  ChartData('Feb', 28),
                  ChartData('Mar', 40),
                  ChartData('Apr', 45),
                  ChartData('May', 50),
                ],
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.count,
                name: 'Technicians',
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String month;
  final int count;

  ChartData(this.month, this.count);
}
