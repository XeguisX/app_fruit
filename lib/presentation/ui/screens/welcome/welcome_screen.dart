import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/ui/screens/welcome/box_bottom_welcome.dart';
import 'package:fruits_app/presentation/ui/screens/welcome/box_top_welcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 13, 13, 14),
          child: const Stack(
            children: [
              Column(
                children: [
                  BoxTopWelcome(),
                  BoxBottomWelcome(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
