import 'package:flutter/material.dart';
import 'widgets/ralist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Maua Trekking',
      home: Home(title: 'Maua Trekking'),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains){
        return constrains.maxWidth <= 900?const MobileLayout():const DesktopLayout();
      })
    );
  }
}


class MobileLayout extends StatefulWidget{
  const MobileLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return MobileLayoutState();
  }
}


class MobileLayoutState extends State<MobileLayout>{

  final List<String> ratitulos = [
    'RA Líder',
    'RA Companheiro 1',
    'RA Companheiro 2',
    'RA Companheiro 3',
    'RA Companheiro 4'
  ];

  final List<IconData> raicones = [
    Icons.person,
    Icons.group, 
    Icons.group,
    Icons.group,
    Icons.group
  ];
 
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(ratitulos.length, (index) => TextEditingController());
  }

  void getTextFieldValues() {
    List<String> valores = controllers.map((controller) => controller.text).toList();
    print(valores);
  }

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold( 
      backgroundColor: const Color.fromARGB(255, 0, 71, 133),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Maua Trekking",
            style: TextStyle(
                fontSize: 24, color: Color.fromARGB(255, 223, 223, 223)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: screenWidth * 0.75,
            height: screenHeight * 0.60,
            child: Container(
              decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 223, 223, 223),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView
                    ( 
                      children: [
                      RaListWidget(icon: raicones[0], title: ratitulos[0], controller: controllers[0],),
                      RaListWidget(icon: raicones[1], title: ratitulos[1], controller: controllers[1]),
                      RaListWidget(icon: raicones[2], title: ratitulos[2], controller: controllers[2]),
                      RaListWidget(icon: raicones[3], title: ratitulos[3], controller: controllers[3]),
                      RaListWidget(icon: raicones[4], title: ratitulos[4], controller: controllers[4]),
                    ],)
                  )),
            ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: getTextFieldValues,child: const Icon(Icons.arrow_forward,color: Color.fromARGB(255, 0, 71, 133),),)
        ]),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget{
  const DesktopLayout({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}