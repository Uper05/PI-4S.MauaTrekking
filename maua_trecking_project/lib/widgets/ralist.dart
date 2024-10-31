import 'package:flutter/material.dart';

class RaListWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller; // Adiciona o controlador como um parâmetro


  const RaListWidget({super.key, required this.icon, required this.title, required this.controller});

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon,color: const Color.fromARGB(255, 0, 71, 133),),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 24.0, fontVariations: [FontVariation('wght', 500.0)],color: Color.fromARGB(255, 0, 71, 133),),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller, // Associando o controlador ao TextField
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 0, 71, 133) )),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 0, 71, 133) )),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 0, 71, 133) )),
            labelText:'Digite o RA',
            labelStyle: TextStyle(fontSize: 20.0,fontVariations: [FontVariation('wght', 400.0)],color: Color.fromARGB(255, 0, 71, 133)),
            hintText: 'XX.XXXXX-X',
          ),
          style: const TextStyle(fontSize: 20.0,fontVariations: [FontVariation('wght', 400.0)]),
        ),
        const SizedBox(height: 20), // Espaço entre os widgets
      ],
    );
  }
}

