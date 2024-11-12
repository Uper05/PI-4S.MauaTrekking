
import 'package:flutter/material.dart';
mixin InfoPopUp {}


Future infoPopup(BuildContext context,double screenHeight,double screenWidth) {
  return showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                      "Informações",
                      style: TextStyle(color: Color.fromARGB(255, 0, 71, 133),fontVariations: [FontVariation("wght", 500.0)]),
                    )
              ],
            ),
            content:SizedBox(height: screenHeight*0.65,width: screenWidth*0.75,child: Image.asset('images/InfoImage.jpg'))
          ));
}
