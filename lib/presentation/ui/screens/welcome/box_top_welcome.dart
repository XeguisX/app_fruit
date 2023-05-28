import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/ui/widgets/box_top.dart';

class BoxTopWelcome extends StatelessWidget {
  const BoxTopWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoxTop(
      percentage: 0.6,
      widget: Center(
        child: Image(
          image: AssetImage('assets/logo_app.png'),
          width: 340,
        ),
      ),
    );
  }
}
