import 'package:flutter/material.dart';

import 'doughnut_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Pie/Doughnut Chart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: DoughnutChart(
          doughnutRadius: 80,
          holeRadius: 60,
          explodeDistance: 2,
          dataYColor: Colors.blueAccent,
          dataXColor: Colors.amberAccent,
          textRadius: 120,
          dataXSize: 18,
          dataYSize: 14,
          data: [
            DoughnutChartData(
                color: Colors.green,
                value: 10000,
                dataString: 'January',
                dataX: 'January',
                dataY: '15000'),
            DoughnutChartData(
                color: Colors.blue,
                value: 12000,
                dataString: 'Febrauary',
                dataX: 'Febrauary',
                dataY: '12000'),
            DoughnutChartData(
                color: Colors.red,
                value: 15000,
                dataString: 'March',
                dataX: 'March',
                dataY: '15000'),
            // DoughnutChartData(
            //     color: Colors.green,
            //     value: 10000,
            //     dataString: 'January',
            //     dataY: '10000',
            //     dataX: 'Jan'),
            // DoughnutChartData(
            //     color: Colors.green,
            //     value: 12000,
            //     dataString: 'Febrauary',
            //     dataY: '12000',
            //     dataX: 'Feb'),
            // DoughnutChartData(
            //     color: Colors.green,
            //     value: 15000,
            //     dataString: 'March',
            //     dataY: '15000',
            //     dataX: 'Mar'),
            // DoughnutChartData(
            //     color: Colors.green,
            //     value: 20000,
            //     dataString: 'April',
            //     dataY: '20000',
            //     dataX: 'Apr'),
            // DoughnutChartData(
            //     color: Colors.green,
            //     value: 11000,
            //     dataString: 'May',
            //     dataY: '11000',
            //     dataX: 'May'),
            // DoughnutChartData(
            //     color: Colors.green,
            //     value: 35000,
            //     dataString: 'June',
            //     dataY: '35000',
            //     dataX: 'Jun'),
            // DoughnutChartData(
            //     color: Colors.blueAccent,
            //     value: 10500,
            //     dataString: 'July',
            //     dataY: '10500',
            //     dataX: 'Jul'),
            // DoughnutChartData(
            //     color: Colors.blueAccent,
            //     value: 11500,
            //     dataString: 'August',
            //     dataY: "11500",
            //     dataX: 'Aug'),
            // DoughnutChartData(
            //     color: Colors.blueAccent,
            //     value: 15200,
            //     dataString: 'September',
            //     dataY: '15200',
            //     dataX: 'Sep'),
            // DoughnutChartData(
            //     color: Colors.blueAccent,
            //     value: 7000,
            //     dataString: 'October',
            //     dataY: '7000',
            //     dataX: 'Oct'),
            // DoughnutChartData(
            //     color: Colors.blueAccent,
            //     value: 25000,
            //     dataString: 'November',
            //     dataY: '25000',
            //     dataX: 'Nov'),
            // DoughnutChartData(
            //     color: Colors.blueAccent,
            //     value: 9000,
            //     dataString: 'Decmber',
            //     dataY: '9000',
            //     dataX: 'Dec')
          ],
        ),
      ),
    );
  }
}
