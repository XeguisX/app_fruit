import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/presentation/ui/widgets/custom_social_button.dart';

class SocialButtonsLogin extends StatelessWidget {
  const SocialButtonsLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              'Puedes ingresar con una de las siguientes opciones',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSocialButton(
                icon: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
              ),
              CustomSocialButton(
                icon: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
