import 'package:flutter/material.dart';
import 'package:fruits_app/data/models/fruit.dart';
import 'package:fruits_app/presentation/controller/fruit_controller.dart';
import 'package:fruits_app/presentation/ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:fruits_app/presentation/ui/widgets/custom_text_field.dart';

class FormFruits extends StatefulWidget {
  const FormFruits({super.key});

  @override
  State<FormFruits> createState() => _FormFruitsState();
}

class _FormFruitsState extends State<FormFruits> {
  final formKeyFruits = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fruitController = Provider.of<FruitController>(context);

    _nameController.text = fruitController.name;
    _descriptionController.text = fruitController.description;

    String? validateName(String? value) {
      return value!.isEmpty ? 'Por favor escriba un nombre' : null;
    }

    String? validateDescription(String? value) {
      return value!.isEmpty ? 'Por favor escriba una descripción' : null;
    }

    return SizedBox(
      height: 328,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Form(
          key: formKeyFruits,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 14),
              CustomTextField(
                autofocus: true,
                fileType: 'Nombre',
                hintText: '  Manzana',
                controller: _nameController,
                onChanged: (value) {
                  fruitController.name = value;
                },
                validator: validateName,
              ),
              const SizedBox(height: 22),
              CustomTextField(
                fileType: 'Descripción',
                hintText: '  Menciona algo sobre la fruta',
                controller: _descriptionController,
                onChanged: (value) {
                  fruitController.description = value;
                },
                validator: validateDescription,
              ),
              const SizedBox(height: 18),
              CustomButton(
                label: fruitController.isLoading ? 'Loading...' : 'Guardar',
                height: 54,
                onPressed: () async {
                  if (!formKeyFruits.currentState!.validate()) {
                    return;
                  }
                  if (fruitController.isEditing) {
                    await fruitController.updateFruit(
                      Fruit(
                        id: fruitController.id,
                        name: fruitController.name,
                        description: fruitController.description,
                      ),
                    );
                    showSnackBarCustom('Fruta actualizada correctamente');
                  } else {
                    await fruitController.registerFruit(
                      Fruit(
                        name: fruitController.name,
                        description: fruitController.description,
                      ),
                    );
                    showSnackBarCustom('Fruta guardada correctamente');
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarCustom(
      String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
