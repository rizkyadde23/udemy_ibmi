import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const InfoCard({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10)],
      ),
      child: child,
    );
  }
}
