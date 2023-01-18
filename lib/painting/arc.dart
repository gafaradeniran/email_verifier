import 'package:flutter/material.dart';

class ArcShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;
    // Offset startPoint = Offset(0, size.height / 2);
    // Offset endPoint = Offset(size.width, size.height / 2);
    // canvas.drawLine(startPoint, endPoint, paint);
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 80, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
