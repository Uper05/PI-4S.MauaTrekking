import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller;
  final String labeltext;
  final String hinttext;
  final bool obscuretext;
  const InputWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.controller,
    required this.labeltext,
    required this.hinttext,
    required this.obscuretext
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color.fromARGB(255, 0, 37, 69),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                  fontVariations: [FontVariation("wght", 400.0)],
                  fontSize: 24.0),
            )
          ],
        ),
        TextField(
          controller: controller,
          obscureText: obscuretext,
          decoration: InputDecoration(
            labelText: labeltext,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 37, 69))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 37, 69))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 37, 69))),
            labelStyle: const TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 0, 37, 69),
                fontVariations: [FontVariation("wght", 400.0)]),
            hintText: hinttext,
          ),
          style: const TextStyle(
              fontSize: 20, fontVariations: [FontVariation("wght", 400.0)]),
        )
      ],
    ));
  }
}
