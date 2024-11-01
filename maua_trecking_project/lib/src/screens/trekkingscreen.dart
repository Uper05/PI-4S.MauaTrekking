import 'package:flutter/material.dart';

class TrekkingScreen extends StatefulWidget {
  const TrekkingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TrekkingScreenState();
  }
}

class TrekkingScreenState extends State<TrekkingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [Text("data")],
        ),
      ),
    );
  }
}
