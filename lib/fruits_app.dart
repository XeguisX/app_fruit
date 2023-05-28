import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/controller/fruit_controller.dart';
import 'package:fruits_app/presentation/ui/screens/welcome/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FruitController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fruits App',
        initialRoute: 'welcome',
        routes: {
          'welcome': (_) => const WelcomeScreen(),
        },
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)
              .apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              )
              .copyWith(
                bodyLarge: const TextStyle(fontFamily: 'Raleway'),
              ),
          scaffoldBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
