import 'package:flutter/material.dart';
import 'package:maua_trecking_project/src/homescreen.dart';

//imports do banco de dados
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maua_trecking_project/src/screens/teacherscreen.dart';
import 'firebase_options.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //^Este método é necessário antes de você executar qualquer código assíncrono, como inicializar o Firebase.
  await Firebase.initializeApp(
    //^Este comando inicializa o Firebase com as configurações que foram geradas anteriormente
    //(no arquivo firebase_options.dart).
    options: DefaultFirebaseOptions.currentPlatform, 
    //^Esta linha recupera as opções de configuração específicas para a plataforma em que o aplicativo
    //está sendo executado (Android, iOS, etc.). O arquivo firebase_options.dart contém as configurações
    //necessárias, como o ID do aplicativo e as credenciais do Firebase.
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maua Trekking',
      theme: ThemeData(fontFamily: "Genos"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
        '/':(context)=>const TelaHome(title: "Maua Trekking",),
        '/telaProfessor':(context)=>const TelaProfessor(title: "Maua Trekking Professores")
      },
    );
  }
}
