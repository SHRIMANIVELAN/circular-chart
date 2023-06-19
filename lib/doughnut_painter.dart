// import 'package:flutter/material.dart';

// class DoughnutPainter extends CustomPainter {
//   final Color fillColor;
//   final Color ringColor;
//   final double ringWidth;

//   DoughnutPainter({required this.fillColor, required this.ringColor, required this.ringWidth});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;
//     final paint = Paint();

//     // Draw the outer ring
//     paint.color = ringColor;
//     canvas.drawCircle(center, radius, paint);

//     // Draw the inner circle to create the doughnut shape
//     paint.color = fillColor;
//     canvas.drawCircle(center, radius - ringWidth, paint);
//   }

//   @override
//   bool shouldRepaint(DoughnutPainter oldDelegate) {
//     return fillColor != oldDelegate.fillColor ||
//         ringColor != oldDelegate.ringColor ||
//         ringWidth != oldDelegate.ringWidth;
//   }
// }

// class DoughnutShape extends StatelessWidget {
//   const DoughnutShape({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: DoughnutPainter(
//         fillColor: Colors.green,
//         ringColor: Colors.black,
//         ringWidth: 20.0,
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Doughnut Shape'),
//       ),
//       body: const Center(
//         child: DoughnutShape(),
//       ),
//     ),
//   ));
// }
