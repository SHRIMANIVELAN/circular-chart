import 'dart:math';
import 'package:flutter/material.dart';

class DoughnutChart extends StatelessWidget {
  final double doughnutRadius;
  final double holeRadius;
  final double explodeDistance;
  final List<DoughnutChartData> data;
  final Color dataXColor;
  final Color dataYColor;
  final double textRadius;
  final double dataXSize;
  final double dataYSize;

  const DoughnutChart({
    Key? key,
    required this.data,
    required this.doughnutRadius,
    this.explodeDistance = 0,
    double? holeRadius,
    this.dataXColor = Colors.black,
    this.dataYColor = Colors.black,
    this.dataXSize = 10,
    this.dataYSize = 10,
    double? textRadius,
  })  : holeRadius = holeRadius ?? doughnutRadius / 4,
        textRadius = textRadius ?? doughnutRadius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DoughnutChartPainter(
          doughnutRadius: doughnutRadius,
          data: data,
          explodeDistance: explodeDistance,
          holeRadius: holeRadius,
          dataXColor: dataXColor,
          dataYColor: dataYColor,
          textRadius: textRadius,
          dataXSize: dataXSize,
          dataYSize: dataYSize),
      child: Container(),
    );
  }
}

class DoughnutChartData {
  final String dataString;
  final double value;
  final Color color;
  final String dataX;
  final String dataY;

  const DoughnutChartData({
    required this.dataString,
    required this.color,
    required this.value,
    String? dataX,
    required this.dataY,
  }) : dataX = dataX ?? dataString;
}

class _DoughnutChartPainter extends CustomPainter {
  final double doughnutRadius;
  final double holeRadius;
  final double explodeDistance;
  final List<DoughnutChartData> data;
  final Color dataXColor;
  final Color dataYColor;
  final double textRadius;
  final double dataXSize;
  final double dataYSize;

  _DoughnutChartPainter(
      {required this.doughnutRadius,
      required this.holeRadius,
      required this.explodeDistance,
      required this.data,
      required this.dataXColor,
      required this.dataYColor,
      required this.textRadius,
      required this.dataXSize,
      required this.dataYSize});

  @override
  void paint(Canvas canvas, Size size) {
    double total = 0.0;
    for (var entry in data) {
      total += entry.value;
    }
    assert(holeRadius < doughnutRadius,
        'holeRadius should be less than doughnutRadius');
    double startRadian = -pi / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    for (var entry in data) {
      double sweepRadian = (entry.value / total) * 2 * pi;

      double explodeX = explodeDistance * cos(startRadian + sweepRadian / 2);
      double explodeY = explodeDistance * sin(startRadian + sweepRadian / 2);

      Path outerPath = Path();
      outerPath.addArc(
        Rect.fromCircle(
            center: Offset(centerX + explodeX, centerY + explodeY),
            radius: doughnutRadius),
        startRadian,
        sweepRadian,
      );
      outerPath.lineTo(centerX, centerY);

      Path holePath = Path();
      holePath.addArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: holeRadius),
        startRadian + sweepRadian,
        -sweepRadian,
      );
      holePath.lineTo(centerX, centerY);

      Path combinedPath =
          Path.combine(PathOperation.difference, outerPath, holePath);

      final paint = Paint()
        ..color = entry.color
        ..style = PaintingStyle.fill;

      canvas.drawPath(combinedPath, paint);
      // Calculate the position of the outer circle

      // ...

      // Calculate the position of dataX and dataY on the outer circle
      double textAngle = startRadian + sweepRadian / 2;
      double textX = centerX + textRadius * cos(textAngle);
      double textY = centerY + textRadius * sin(textAngle) - 8;

      // Draw the dataX text
      TextSpan dataXSpan = TextSpan(
        text: entry.dataX,
        style: TextStyle(
          color: dataXColor,
          fontSize: dataXSize,
        ),
      );
      TextPainter dataXPainter = TextPainter(
        text: dataXSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      dataXPainter.layout();

      double dataXTextX = textX - dataXPainter.width / 2;
      double dataXTextY = textY - dataXPainter.height / 2;

      Offset dataXOffset = Offset(dataXTextX, dataXTextY);
      dataXPainter.paint(canvas, dataXOffset);

      // Draw the dataY text
      TextSpan dataYSpan = TextSpan(
        text: entry.dataY,
        style: TextStyle(
          color: dataYColor,
          fontSize: dataYSize,
        ),
      );
      TextPainter dataYPainter = TextPainter(
        text: dataYSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      dataYPainter.layout();

      double dataYTextX = textX - dataYPainter.width / 2;
      double dataYTextY = textY + dataYPainter.height / 2;

      Offset dataYOffset = Offset(dataYTextX, dataYTextY);
      dataYPainter.paint(canvas, dataYOffset);

      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
