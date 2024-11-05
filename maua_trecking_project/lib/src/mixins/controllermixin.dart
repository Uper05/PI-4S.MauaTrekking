import 'package:flutter/material.dart';
import '../back_end/firestore.dart';

mixin class Controllermixin {
  String getTextFieldValues(List<TextEditingController> controllers, BuildContext context) {
    List<String> valores =
        controllers.map((controller) => controller.text).toList();

    //chamando função do firestore.dart(U:Lembrar de Descomentar as funções após terminar a tela de trekking)
    salvarEquipe(valores);
    String horario = salvarHorario();
    Navigator.pushNamed(context, '/telaTrekking');
    return horario;
  }

}
