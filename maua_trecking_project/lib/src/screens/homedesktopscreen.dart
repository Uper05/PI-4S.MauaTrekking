import 'package:flutter/material.dart';
import 'package:maua_trecking_project/src/mixins/controllermixin.dart';
import 'package:maua_trecking_project/src/mixins/listmixin.dart';
import 'package:maua_trecking_project/src/mixins/popupmixin.dart';
import '../widgets/ralist.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return DesktopLayoutState();
  }
}

class DesktopLayoutState extends State<DesktopLayout> with ListaMixin,Controllermixin,Popupmixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 500,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              actions: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 223, 223, 223),
                      shape: BoxShape.circle),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/telaProfessor');
                      },
                      icon: const Icon(
                        Icons.book,
                        color: Color.fromARGB(255, 0, 71, 133),
                      )),
                )
              ],
            ),
          ),
          const Text(
            "Maua Trekking",
            style: TextStyle(
                fontSize: 36.0, color: Color.fromARGB(255, 223, 223, 223),fontVariations: [FontVariation('wght', 600.0)],
          )),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 500,
              height: 400,
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 223, 223),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: [
                          RaListWidget(
                            icon: raicones[0],
                            title: ratitulos[0],
                            controller: controllers[0],
                          ),
                          RaListWidget(
                              icon: raicones[1],
                              title: ratitulos[1],
                              controller: controllers[1]),
                          RaListWidget(
                              icon: raicones[2],
                              title: ratitulos[2],
                              controller: controllers[2]),
                          RaListWidget(
                              icon: raicones[3],
                              title: ratitulos[3],
                              controller: controllers[3]),
                          RaListWidget(
                              icon: raicones[4],
                              title: ratitulos[4],
                              controller: controllers[4]),
                        ],
                      ))),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                decoration: 
                const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 223, 223, 223)),
                child: IconButton(
                    onPressed: () => popUpConfirma(context, 300,
                        200, controllers),
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 0, 71, 133),
                    )),
              ))
        ]),
      ),
    );
  }
}
