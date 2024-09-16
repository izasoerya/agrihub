import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartTable extends StatelessWidget {
  const ChartTable({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];
    return Container(
      width: double.infinity,
      height:
          ScreenUtil().orientation == Orientation.portrait ? 0.4.sh : 0.8.sh,
      margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        title: const ChartTitle(text: 'Grafik Beberapa Bulan Terakhir'),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<_SalesData, String>>[
          LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Kelembapan (%RH)',
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
