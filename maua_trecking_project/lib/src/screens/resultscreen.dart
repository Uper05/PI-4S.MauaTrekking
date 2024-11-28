import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget{
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState()=>ResultScreenState();
}
class ResultScreenState extends State<ResultScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 37, 69),
      appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: const Color.fromARGB(0, 0, 0, 0),),
      body:Center(child: Text("Teste",style:TextStyle(color: Colors.white) ,)),
      );
  }
}