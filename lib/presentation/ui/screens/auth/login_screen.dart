import 'package:flutter/material.dart';
import 'footer_login.dart';
import 'form_login.dart';
import 'header_login.dart';
import 'social_buttons_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderLogin(),
              SizedBox(height: 28),
              SocialButtonsLogin(),
              FormLogin(),
              FooterLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
