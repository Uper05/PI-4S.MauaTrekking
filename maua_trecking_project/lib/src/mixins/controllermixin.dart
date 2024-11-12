import 'package:flutter/material.dart';
import '../back_end/firestore.dart';

mixin class Controllermixin {
  Future<void> getTextFieldValues(List<TextEditingController> controllers, BuildContext context) async {
    // Obtém os valores dos campos de texto
    List<String> valores = controllers.map((controller) => controller.text).toList();

    // Salva a equipe e armazena o ID da equipe no backend
    String docId = await salvarEquipe(valores);

    registrarHoraInicio();

    // Navega para a próxima tela
    Navigator.pushNamed(context, '/telaTrekking');
  }

}
