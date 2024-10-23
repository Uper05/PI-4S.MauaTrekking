import 'package:flutter/material.dart';

class MobileLayoutProfessor extends StatefulWidget{
  const MobileLayoutProfessor({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobileLayoutProfessorState();
  }
}

class MobileLayoutProfessorState extends State<MobileLayoutProfessor>{

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 37, 69), 
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        actions: [
          Container(
            margin:const EdgeInsets.only(right: 10,top: 10),
            decoration:  const BoxDecoration(
                color: Color.fromARGB(255, 223, 223, 223),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 71, 133),
                )),
          )
        ],
      ),
    );
  }
}
