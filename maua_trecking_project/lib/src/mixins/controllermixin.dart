import 'package:flutter/material.dart';

mixin class Controllermixin {
  List<String> getTextFieldValues(List<TextEditingController> controllers) {
    List<String> valores =
        controllers.map((controller) => controller.text).toList();
    print(valores);
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
                      style: TextStyle(color: Color.fromARGB(255, 0, 71, 133),fontVariations: [FontVariation("wght", 500.0)]),
                    )
                  ],
                ),
                content: SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: const Center(
                    child: Text(
                      "Verifique que os RA's escritos estão de acordo com os RA's do seu grupo, não será possível muda-lôs após o registro. No caso de erro fale com seu professor",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 71, 133), fontSize: 20,fontVariations: [FontVariation("wght", 400.0)]),
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
                          child: const Text("Cancelar",style: TextStyle(fontSize: 18.0,fontVariations: [FontVariation("wght", 400.0)]),)),
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
                          child: const Text("Confirma",style:TextStyle(fontSize: 18.0,fontVariations: [FontVariation("wght", 400.0)]),)),
                    ],
                  ),
                ],
              )
            );
}
