import 'package:flutter/material.dart';

class CustomLoadingProgressBar extends StatelessWidget {
  const CustomLoadingProgressBar({Key? key, required this.color, this.strokeWidth=1, this.width=20, this.height=20}) : super(key: key);
  final Color color;
  final double strokeWidth;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
