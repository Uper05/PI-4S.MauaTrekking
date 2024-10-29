import 'package:flutter/material.dart';
import '../back_end/firestore.dart';

mixin class Controllermixin {
  List<String> getTextFieldValues(List<TextEditingController> controllers) {
    List<String> valores =
        controllers.map((controller) => controller.text).toList();

    //chamando função do firestore.dart
    salvarEquipe(valores);
    salvarHorario();

    return valores;
  }


  Future popUpConfirma(BuildContext context, double screenWidth,double screenHeight,List<TextEditingController> controllers) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aviso",
                      style: TextStyle(color: Color.fromARGB(255, 0, 71, 133)),
                    )
                  ],
                ),
                content: SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: const Center(
                    child: Text(
                      "Verifique que os RA's escritos estão de acordo com os RA's do seu grupo, não será possível muda-lôs após o registro.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 71, 133), fontSize: 20),
                    ),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 0, 71, 133),
                            side: const BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 0, 71, 133)),
                          ),
                          onPressed: Navigator.of(context).pop,
                          child: const Text("Cancelar")),
                      const Spacer(),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(255, 0, 71, 133),
                            side: const BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 0, 71, 133)),
                          ),
                          onPressed: () =>getTextFieldValues(controllers),
                          child: const Text("Confirma")),
                    ],
                  ),
                ],
              ));
}
