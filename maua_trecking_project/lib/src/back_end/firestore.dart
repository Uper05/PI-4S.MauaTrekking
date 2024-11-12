import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

Future<void> salvarEquipe(List<String> valores) async {
  await firestoreDB.collection("Equipe").add({
    'RAEquipe': valores,
  });

}

Future<void> salvarHorario() async {
  DateTime agora = DateTime.now();
  String horario = "${agora.hour}:${agora.minute}:${agora.second}";
}
