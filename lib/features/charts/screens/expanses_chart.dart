import 'package:super_track/constants/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class SuperTrackExpansesChart extends StatefulWidget {
  const SuperTrackExpansesChart({super.key});

  @override
  State<SuperTrackExpansesChart> createState() =>
      _SuperTrackExpansesChartState();
}

class _SuperTrackExpansesChartState extends State<SuperTrackExpansesChart> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 20),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 44),
    _SalesData('Aug', 42),
    _SalesData('Sep', 15),
    _SalesData('Dec', 33),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanses Track'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 450,
              child: SfCartesianChart(
                legend: Legend(
                  isVisible: true,
                ),
                title: ChartTitle(text: 'Expanses Tracking'),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries<_SalesData, String>>[
                  SplineSeries<_SalesData, String>(
                    legendItemText: 'Outcomes',
                    color: primaryProfileColor,
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
