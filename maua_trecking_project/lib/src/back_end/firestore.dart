import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
String? _equipeId; // Variável para armazenar o ID da equipe
DateTime? _horaInicio; // Horário de início
List<DateTime> _horariosPontos = []; // Lista para armazenar os horários dos pontos
List<int> _pontuacoes = []; // Lista para armazenar as pontuações

// Função para salvar a equipe e armazenar o ID do documento criado
Future<String> salvarEquipe(List<String> valores) async {
  DocumentReference docRef = await firestoreDB.collection("Equipe").add({
    'RAEquipe': valores,
    'pontuacoes': [], // Inicializa a lista de pontuação vazia
  });
  _equipeId = docRef.id; // Salva o ID do documento na variável
  return _equipeId!;
}

// Função para registrar o horário de início
void registrarHoraInicio() {
  _horaInicio = DateTime.now();
  _horariosPontos.add(_horaInicio!); // Adiciona o horário de início à lista
}

// Função para registrar o horário de um ponto de parada
void registrarHoraPonto() {
  if (_horaInicio != null) {
    DateTime horaPonto = DateTime.now();
    _horariosPontos.add(horaPonto); // Adiciona o horário do ponto à lista
  } else {
    print("Erro: O horário de início não foi registrado.");
  }
}

// Função para calcular os pontos entre o horário anterior e o atual
Future<int> calcularPontos() async {
  if (_horariosPontos.length > 1) {
    // Calcula a diferença entre o último ponto e o penúltimo
    DateTime horaAnterior = _horariosPontos[_horariosPontos.length - 2];
    DateTime horaAtual = _horariosPontos.last;
    
    // Calcula a diferença em minutos
    Duration duracao = horaAtual.difference(horaAnterior);
    
    // Calcula a pontuação (5 pontos por cada minuto de diferença)
    int pontos = duracao.inMinutes * 5;
    
    // Adiciona a pontuação à lista
    _pontuacoes.add(pontos);

    // Salva a pontuação no Firestore na lista de pontuações da equipe
    if (_equipeId != null) {
      await firestoreDB.collection("Equipe").doc(_equipeId).update({
        'pontuacoes': FieldValue.arrayUnion([pontos]), // Adiciona a pontuação na lista
      });
    }

    return pontos;
  } else {
    throw Exception("Não há pontos suficientes registrados para calcular a pontuação.");
  }
}

// Função para obter o ID da equipe armazenado
String? getEquipeId() {
  return _equipeId;
}
