import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Verifica os dados no Firestore
      final query = await _firestore
          .collection('Professor')
          .where('emailProf', isEqualTo: email)
          .where('senhaProf', isEqualTo: password)
          .get();

      if (query.docs.isNotEmpty) {
        //login válido, navega para a próxima tela
        Navigator.pushReplacementNamed(context, '/telaTrekking');
      } else {
        // Exibe um Toast de erro caso os dados sejam inválidos
        Fluttertoast.showToast(
          msg: "Login inválido. Verifique suas credenciais.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      // Trata erros e exibe um Toast de erro genérico
      Fluttertoast.showToast(
        msg: "Erro ao tentar fazer login: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
