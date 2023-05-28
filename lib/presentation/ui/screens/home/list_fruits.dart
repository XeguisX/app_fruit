import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/controller/fruit_controller.dart';
import 'package:fruits_app/data/models/fruit.dart';
import 'package:provider/provider.dart';

import 'item_fruit.dart';

class ListFruits extends StatelessWidget {
  const ListFruits({super.key});

  @override
  Widget build(BuildContext context) {
    final fruitsController = Provider.of<FruitController>(context);

    List<Fruit> fruits = fruitsController.fruitsList;

    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            final fruit = fruits[index];

            return Dismissible(
              key: Key(fruit.id.toString()),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 14.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                fruitsController.deleteFruit(fruit.id!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fruta Eliminada Correctamente'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: ItemFruit(
                id: fruit.id!,
                name: fruit.name,
                description: fruit.description,
              ),
            );
          },
        ),
      ),
    );
  }
}
