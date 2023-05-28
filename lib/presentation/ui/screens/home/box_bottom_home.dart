import 'package:flutter/material.dart';
import 'list_fruits.dart';
import 'package:provider/provider.dart';
import 'package:fruits_app/presentation/controller/fruit_controller.dart';
import 'package:fruits_app/presentation/ui/widgets/box_bottom.dart';

class BoxBottomHome extends StatelessWidget {
  const BoxBottomHome({super.key});

  @override
  Widget build(BuildContext context) {
    final fruitsController = Provider.of<FruitController>(context);

    return BoxBottom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      percentage: 0.6,
      widget: Column(
        children: [
          const Text(
            'Frutas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              fruitsController.fruitsList.isEmpty
                  ? Container()
                  : const Icon(Icons.info_outline_rounded),
              const SizedBox(width: 8),
              fruitsController.fruitsList.isEmpty
                  ? Container()
                  : const Text(
                      'Desliza hacia la izquierda o derecha \nel item de la fruta para eliminarlo',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 14),
          fruitsController.isLoading
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: SizedBox(
                    child: Image(
                      width: 280,
                      image: AssetImage('assets/loading.gif'),
                    ),
                  ),
                )
              : fruitsController.fruitsList.isEmpty
                  ? const Column(
                      children: [
                        SizedBox(height: 32),
                        Icon(
                          Icons.upcoming_outlined,
                          color: Color.fromARGB(217, 204, 31, 190),
                          size: 64,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'No tienes frutas favoritas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),
                        Text(
                          '¡ Añade una ahora !',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),
                        Icon(
                          Icons.arrow_downward_rounded,
                          color: Color.fromARGB(217, 204, 31, 190),
                          size: 54,
                        ),
                      ],
                    )
                  : const ListFruits(),
        ],
      ),
    );
  }
}
