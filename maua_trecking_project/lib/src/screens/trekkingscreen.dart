import 'package:flutter/material.dart';
import 'package:maua_trecking_project/src/mixins/popup_info_mixin.dart';
import '../back_end/storage.dart';

class TrekkingScreen extends StatefulWidget {
  const TrekkingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TrekkingScreenState();
  }
}

class TrekkingScreenState extends State<TrekkingScreen> with InfoPopUp {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 0, 71, 133),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 223, 223, 223),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                 infoPopup(context,screenHeight,screenWidth);
                },
                icon: const Icon(
                  Icons.info,
                  color: Color.fromARGB(255, 0, 71, 133),
                )),
          )
        ],
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
