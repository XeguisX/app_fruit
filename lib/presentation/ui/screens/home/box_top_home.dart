import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/ui/screens/welcome/welcome_screen.dart';
import 'package:fruits_app/presentation/ui/widgets/box_top.dart';

class BoxTopHome extends StatelessWidget {
  const BoxTopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoxTop(
      percentage: 0.4,
      widget: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ContentTop(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentTop extends StatelessWidget {
  const _ContentTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Hola, Abdí!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Color.fromARGB(217, 204, 31, 190),
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gestiona tus frutas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Fruits App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.appleAlt,
                      color: Color.fromARGB(217, 204, 31, 190),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Administra tus frutas favoritas aquí  \nAgrega, actualiza y elimina a tu gusto',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
