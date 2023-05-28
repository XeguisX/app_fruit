import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(174, 0, 0, 0),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white70,
                  size: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Container(
            child: const Text(
              'Ingresar',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
