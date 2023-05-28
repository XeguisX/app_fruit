import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key, required this.icon});

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 174,
          decoration: BoxDecoration(
            color: const Color.fromARGB(174, 0, 0, 0),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: icon,
          ),
        ),
      ),
    );
  }
}
