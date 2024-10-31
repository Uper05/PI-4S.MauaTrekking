
import 'package:flutter/material.dart';
import 'package:maua_trecking_project/src/screens/teacherdesktopscreen.dart';
import 'package:maua_trecking_project/src/screens/teachermobilescreen.dart';

class TelaProfessor extends StatelessWidget {
  const TelaProfessor({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains){
        return constrains.maxWidth <= 700? const MobileLayoutProfessor():const DesktopLayoutProfessor();
      })
    );
  }
}