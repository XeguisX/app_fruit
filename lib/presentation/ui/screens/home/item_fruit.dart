import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/controller/fruit_controller.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class ItemFruit extends StatelessWidget {
  const ItemFruit({
    Key? key,
    required this.name,
    required this.description,
    required this.id,
  }) : super(key: key);

  final int id;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final fruitsController = Provider.of<FruitController>(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      color: const Color.fromARGB(255, 182, 20, 218),
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  openEditFruitModal(
                      context, fruitsController, id, name, description);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openEditFruitModal(BuildContext context, FruitController fruitsController,
    int id, String name, String description) {
  fruitsController.isEditing = true;
  fruitsController.id = id;
  fruitsController.name = name;
  fruitsController.description = description;

  showFormFruitModalBottom(context);
}
