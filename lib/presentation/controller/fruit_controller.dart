import 'package:flutter/material.dart';
import 'package:fruits_app/data/models/fruit.dart';
import 'package:fruits_app/data/data_source/db_manager.dart';
import 'package:logger/logger.dart';

class FruitController extends ChangeNotifier {
  int id = 0;
  String name = '';
  String description = '';

  bool isLoading = false;
  bool isEditing = false;

  bool isValidate = false;

  List<Fruit> fruitsList = [];

  var logger = Logger();

  clean() {
    id = 0;
    name = '';
    description = '';
  }

  FruitController() {
    logger.i('FruitController inializado');
    getAllFruits();
  }

  Future<void> getAllFruits() async {
    try {
      isLoading = true;
      notifyListeners();
      var fruits = await DBManager.db.getFruits();
      fruitsList = [...fruits];
      isLoading = false;
      notifyListeners();
    } catch (e) {
      logger.e('Error al obtener las frutas: $e');
      isLoading = false;
      notifyListeners();
    }
  }

  Future<int?> registerFruit(Fruit fruitToAdd) async {
    try {
      isLoading = true;
      notifyListeners();
      final insertedId = await DBManager.db.registerFruit(fruitToAdd);

      if (insertedId != -1) {
        final newFruit = Fruit(
          id: insertedId,
          name: fruitToAdd.name,
          description: fruitToAdd.description,
        );
        fruitsList.add(newFruit);
      }

      isLoading = false;
      notifyListeners();
      clean();

      return insertedId;
    } catch (e) {
      logger.e('Error al insertar $e');
      isLoading = false;
      notifyListeners();

      return null;
    }
  }

  Future<int?> updateFruit(Fruit updatefruit) async {
    try {
      isLoading = true;
      notifyListeners();
      final rowFruit = await DBManager.db.updateFruit(updatefruit);

      if (rowFruit > 0) {
        final index =
            fruitsList.indexWhere((fruit) => fruit.id == updatefruit.id);
        if (index != -1) {
          fruitsList[index] = updatefruit;
          isEditing = false;
        }
      }

      isLoading = false;
      notifyListeners();
      clean();
      return rowFruit;
    } catch (e) {
      logger.e('Error al actualizar $e');
      isLoading = false;
      notifyListeners();

      return null;
    }
  }

  Future<int?> deleteFruit(int id) async {
    try {
      final fruitDeleted = await DBManager.db.deleteFruit(id);
      if (fruitDeleted > 0) {
        fruitsList.removeWhere((fruit) => fruit.id == id);
        notifyListeners();
      }
      return fruitDeleted;
    } catch (e) {
      logger.e('Error al eliminar $e');
      return null;
    }
  }
}
