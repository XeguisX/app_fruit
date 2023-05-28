import 'package:fruits_app/data/models/fruit.dart';

Fruit fromJsonFruit(Map<String, dynamic> json) {
  return Fruit(
    id: json['id'],
    name: json['name'],
    description: json['description'],
  );
}

Map<String, dynamic> toJsonFruit(Fruit fruit) => {
      "id": fruit.id,
      "name": fruit.name,
      "description": fruit.description,
    };
