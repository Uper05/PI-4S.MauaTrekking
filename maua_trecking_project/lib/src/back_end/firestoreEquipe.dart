import 'package:cloud_firestore/cloud_firestore.dart';

//instanciando variáveis
FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
String? _equipeId;  // ID da equipe
List<int>? _pontuacoes; // Lista de pontuações armazenada localmente

// Função para obter o ID da equipe armazenado
String? getEquipeId() {
  return _equipeId;
}

// Função para obter todos os documentos da coleção 'Equipe' e atualizá-los em tempo real
Stream<QuerySnapshot> obterEquipes() {
  return FirebaseFirestore.instance.collection('Equipe').snapshots();
}

// Função para obter as pontuações de uma equipe no Firestore
List<int>? getPontuacao(){
  return _pontuacoes;
}

// Função para obter o tamanho da lista de pontuações de uma equipe no Firestore
Future<int?> getTamanhoPontuacao() async {
  return getPontuacao()?.length ?? 0; // retorna 0 se a lista for nula
}

// Função para salvar a equipe e armazenar o ID do documento criado
Future<String> salvarEquipe(List<String> valores) async {
  DocumentReference docRef = await firestoreDB.collection("Equipe").add({
    'RAEquipe': valores,
    'pontuacoes': [],
  });
  _equipeId = docRef.id;
  return _equipeId!;
}

// Função para atualizar a pontuação de uma equipe no Firestore
Future<void> atualizarPontuacao(int pontos) async {
  if (_equipeId == null) {
    throw Exception("O ID da equipe não foi inicializado. Salve a equipe primeiro.");
  }

  await firestoreDB.collection("Equipe").doc(_equipeId).update({
    'pontuacoes': FieldValue.arrayUnion([pontos]), // Adiciona a pontuação ao Firestore
  });
  
  // Atualiza também a lista local
  _pontuacoes = (_pontuacoes ?? [])..add(pontos);
}

Future<void> atualizarRA(String equipeId, int index, String novoRA) async {
  // Obter o documento atual
  DocumentSnapshot docSnapshot = await firestoreDB.collection('Equipe').doc(equipeId).get();
  List<String> raEquipeList = List<String>.from(docSnapshot['RAEquipe'] ?? []);

  // Atualizar o RA específico
  if (index >= 0 && index < raEquipeList.length) {
    raEquipeList[index] = novoRA;

    // Enviar a atualização para o Firestore
    await firestoreDB.collection('Equipe').doc(equipeId).update({
      'RAEquipe': raEquipeList,
    });
  }
}
