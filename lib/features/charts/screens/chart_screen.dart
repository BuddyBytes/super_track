import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SuperTrackChartsScreen extends StatefulWidget {
  const SuperTrackChartsScreen({super.key});

  @override
  State<SuperTrackChartsScreen> createState() => _SuperTrackChartsScreenState();
}

class _SuperTrackChartsScreenState extends State<SuperTrackChartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Activities'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(
            text: 'Monthly Spending',
          ),
          // Enable legend
          legend: Legend(
            isVisible: true,
          ),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(
            enable: true,
          ),
          series: <ChartSeries<_Infections, String>>[
            LineSeries<_Infections, String>(
                color: primaryCardColor,
                dataSource: <_Infections>[
                  _Infections('Jan', 35000),
                  _Infections('Feb', 28000),
                  _Infections('Mar', 34000),
                  _Infections('Apr', 32000),
                  _Infections('May', 40000),
                  _Infections('Jun', 60000),
                  _Infections('August', 60000),
                ],
                xValueMapper: (_Infections balance, _) => balance.year,
                yValueMapper: (_Infections balance, _) => balance.balance,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ],
        ),
      ),
    );
  }
}

class _Infections {
  _Infections(this.year, this.balance);

  final String year;
  final double balance;
}
