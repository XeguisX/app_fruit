import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/ui/widgets/custom_text_field.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 38),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CustomTextField(
              fileType: 'Correo',
              hintText: '  Ejemplo@mail.com',
              isEmail: true,
            ),
            SizedBox(height: 22),
            CustomTextField(
              fileType: 'Contraseña',
              hintText: '  Ingresa tu contraseña',
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}
