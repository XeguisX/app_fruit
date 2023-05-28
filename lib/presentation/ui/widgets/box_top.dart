import 'package:flutter/material.dart';

class BoxTop extends StatelessWidget {
  const BoxTop({
    Key? key,
    required this.percentage,
    required this.widget,
  }) : super(key: key);

  final double percentage;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * percentage,
      child: widget,
    );
  }
}
