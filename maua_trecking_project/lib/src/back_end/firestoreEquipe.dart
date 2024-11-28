import 'package:cloud_firestore/cloud_firestore.dart';

//instanciando variáveis
FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
String? _equipeId;  // ID da equipe
List<int>? _pontuacoes; // Lista de pontuações armazenada localmente

// Função para obter o ID da equipe armazenado
String? getEquipeId() {
  return _equipeId;
}

// Função para obter os RAs da equipe armazenados no Firestore
Future<List<String>?> getEquipeRA() async {
  if (_equipeId == null) {
    throw Exception("O ID da equipe não foi inicializado. Salve a equipe primeiro.");
  }

  // Recupera o documento da equipe do Firestore
  DocumentSnapshot docSnapshot = await firestoreDB.collection("Equipe").doc(_equipeId).get();
  
  if (docSnapshot.exists) {
    // Converte os dados para Map<String, dynamic> para acessar os campos
    Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
    
    // Recupera os RAs da equipe (caso existam) e retorna como uma lista de strings
    List<dynamic> rAs = data?['RAEquipe'] ?? [];
    return List<String>.from(rAs);
  } else {
    throw Exception("Documento da equipe não encontrado no Firestore.");
  }
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
