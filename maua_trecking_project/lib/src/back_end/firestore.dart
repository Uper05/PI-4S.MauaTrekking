import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
String? _equipeId;  // ID da equipe
List<DateTime> _horariosPontos = [];  // Lista de horários
List<int> _pontuacoes = [];  // Lista de pontuações

// Função para salvar a equipe e armazenar o ID do documento criado
Future<String> salvarEquipe(List<String> valores) async {
  DocumentReference docRef = await firestoreDB.collection("Equipe").add({
    'RAEquipe': valores,
    'pontuacoes': [],
  });
  _equipeId = docRef.id;
  return _equipeId!;
}

// Função para registrar o horário
Future<void> registrarHora() async {
  if (_equipeId == null) {
    throw Exception("Equipe não registrada.");
  }

  DateTime horaAgora = DateTime.now();
  _horariosPontos.add(horaAgora);  // Adiciona o horário à lista local
}

// Função para calcular e registrar os pontos
Future<int> calcularPontos() async {
  if (_horariosPontos.length > 1) {
    // Calcula a diferença entre o último ponto e o penúltimo
    DateTime horaAnterior = _horariosPontos[_horariosPontos.length - 2];
    DateTime horaAtual = _horariosPontos.last;

    Duration duracao = horaAtual.difference(horaAnterior);
    int pontos = duracao.inSeconds * 5;  // Calcula a pontuação (5 pontos por minuto de diferença)
    _pontuacoes.add(pontos);  // Adiciona a pontuação à lista local

    // Atualiza Firestore com a nova pontuação
    await firestoreDB.collection("Equipe").doc(_equipeId).update({
      'pontuacoes': FieldValue.arrayUnion([pontos]),  // Adiciona a pontuação ao Firestore
    });

    return pontos;
  } else {
    throw Exception("Não há pontos suficientes registrados para calcular a pontuação.");
  }
}

// Função para obter o ID da equipe armazenado
String? getEquipeId() {
  return _equipeId;
}
