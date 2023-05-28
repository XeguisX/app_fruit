import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/ui/screens/home/home_screen.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 182, 20, 218),
                  Color.fromARGB(255, 204, 31, 190),
                ],
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "No tienes una cuenta?",
                style: TextStyle(fontSize: 16, color: Colors.white60),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                child: const Text(
                  'Registrate',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
