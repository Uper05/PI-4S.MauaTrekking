import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:maua_trecking_project/src/screens/calcularpontos.dart';
import 'package:maua_trecking_project/src/screens/homescreen.dart';
import 'package:maua_trecking_project/src/screens/teacherscreen.dart';
import 'package:maua_trecking_project/src/screens/trekkingscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _initializeDeepLinks();
  }

  Future<void> _initializeDeepLinks() async {
    _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        debugPrint('Deep Link recebido: $uri');
        // Verifique o caminho para tomar a ação adequada
        if (uri.path == '/pontuar') {
          // Navegue para a tela de pontuação (ou chame os métodos diretamente)
          _navigatorKey.currentState?.pushNamed('/pontuar');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Maua Trekking',
      theme: ThemeData(fontFamily: "Genos"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaHome(title: "Maua Trekking"),
        '/telaProfessor': (context) => const TelaProfessor(title: "Maua Trekking Professores"),
        '/telaTrekking': (context) => const TrekkingScreen(),
        '/pontuar': (context) => const CalcularPontosScreen(),
      },
    );
  }
}
