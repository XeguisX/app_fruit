import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/controller/fruit_controller.dart';
import 'package:provider/provider.dart';

import 'box_bottom_home.dart';
import 'box_top_home.dart';
import 'form_fruit_modal_bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fruitsController = Provider.of<FruitController>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          fruitsController.clean();
          fruitsController.isEditing = false;
          showFormFruitModalBottom(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        color: const Color.fromARGB(255, 13, 13, 14),
        child: const Stack(
          children: [
            Column(
              children: [
                BoxTopHome(),
                BoxBottomHome(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

showFormFruitModalBottom(BuildContext context) {
  return showModalBottomSheet(
    elevation: 5,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          const FormFruitModalBottom(),
        ],
      );
    },
  );
}
