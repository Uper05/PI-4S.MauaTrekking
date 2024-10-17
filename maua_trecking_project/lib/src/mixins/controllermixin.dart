
import 'package:flutter/material.dart';
import 'package:maua_trecking_project/src/mixins/listmixin.dart';

mixin class Controllermixin {

  List<String> getTextFieldValues(List<TextEditingController> controllers) {
    List<String> valores =
        controllers.map((controller) => controller.text).toList();
    print(valores);
    return valores;
  }
}