import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/ui/screens/auth/login_screen.dart';
import 'package:fruits_app/presentation/ui/widgets/box_bottom.dart';
import 'package:fruits_app/presentation/ui/widgets/custom_button.dart';

class BoxBottomWelcome extends StatelessWidget {
  const BoxBottomWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxBottom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      percentage: 0.4,
      widget: Column(
        children: [
          const Text(
            'Fruits App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            '¡Bienvenido a nuestra aplicación para guardar frutas! Con esta aplicación, podrás llevar un registro organizado y fácil de tus frutas favoritas. Podrás agregar nuevas frutas, incluyendo su nombre y descripción. También tendrás la opción de editar y eliminar frutas según tus necesidades',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          CustomButton(
            label: 'Ingresar',
            height: 54,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
