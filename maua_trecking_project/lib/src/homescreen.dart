import 'package:flutter/material.dart';
import 'screens/homemobilescreen.dart';
import 'screens/homedesktopscreen.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrains){
        return constrains.maxWidth <= 700?const MobileLayout(): DesktopLayout();
      })
    );
  }
}