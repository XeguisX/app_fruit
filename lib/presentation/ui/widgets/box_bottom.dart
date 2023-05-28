import 'package:flutter/material.dart';

class BoxBottom extends StatelessWidget {
  const BoxBottom({
    Key? key,
    required this.padding,
    required this.percentage,
    required this.widget,
  }) : super(key: key);

  final EdgeInsets padding;
  final double percentage;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      width: double.infinity,
      height: size.height * percentage,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
        boxShadow: [
          BoxShadow(
            color: Colors.white12,
            offset: Offset(0, -1),
            blurRadius: 4,
          ),
        ],
      ),
      child: widget,
    );
  }
}
