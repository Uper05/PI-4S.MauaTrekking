import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
String? _equipeId;  // ID da equipe
List<DateTime> _horariosPontos = [];  // Lista de horários do usuário
List<int> _pontuacoes = [];  // Lista de pontuações

// Função para obter o ID da equipe armazenado
String? getEquipeId() {
  return _equipeId;
}

Future<int> getTamanhoPontuacao() async{
  return _pontuacoes.length;
}

// Distâncias e velocidades dos trechos
List<Map<String, double>> trechos = [
  {'distancia': 125.0, 'velocidade': 40.0},  // trecho 1
  {'distancia': 166.0, 'velocidade': 50.0},  // trecho 2
  {'distancia': 144.0, 'velocidade': 35.0},  // trecho 3
  {'distancia': 214.0, 'velocidade': 55.0},  // trecho 4
  {'distancia': 215.0, 'velocidade': 40.0},  // trecho 5
  {'distancia': 200.0, 'velocidade': 50.0},  // trecho 6
  {'distancia': 247.0, 'velocidade': 35.0},  // trecho 7
];

// Função para salvar a equipe e armazenar o ID do documento criado
Future<String> salvarEquipe(List<String> valores) async {
  DocumentReference docRef = await firestoreDB.collection("Equipe").add({
    'RAEquipe': valores,
    'pontuacoes': [],
  });
  _equipeId = docRef.id;
  return _equipeId!;
}

// Função para registrar o horário inicial
Future<void> registrarHora() async {
  if (_equipeId == null) {
    throw Exception("Equipe não registrada.");
  }

  DateTime horaAgora = DateTime.now();
  _horariosPontos.add(horaAgora);  // Adiciona o horário à lista local
}

// Função para calcular o tempo estimado para o próximo ponto
DateTime calcularHoraEstimado(DateTime horaAnterior, double distancia, double velocidade) {
  // Calcula o tempo necessário para percorrer o trecho (em segundos)
  double tempoSegundos = (distancia / velocidade) * 60;  // tempo = distancia / velocidade
  return horaAnterior.add(Duration(seconds: tempoSegundos.toInt()));  // Retorna o horário estimado
}

// Função para calcular e registrar os pontos e horários estimados
Future<int> calcularPontos() async {
  if (_horariosPontos.length > 1) {
    // Pega o horário real de chegada
    DateTime horaRealChegada = _horariosPontos.last;

    // Calcula a hora estimada de chegada com base no último ponto registrado
    DateTime horaEstimativa = calcularHoraEstimado(
      _horariosPontos[_horariosPontos.length - 2], // Hora do último ponto
      trechos[_horariosPontos.length - 2]['distancia']!, // Distância do próximo trecho
      trechos[_horariosPontos.length - 2]['velocidade']!, // Velocidade do próximo trecho
    );

    // Calcula a diferença entre a hora estimada e a hora real de chegada
    Duration duracao = horaRealChegada.difference(horaEstimativa);
    
    // Calcula os pontos (baseado na diferença de tempo, em segundos)
    int pontos = duracao.inSeconds.abs(); // Usamos a diferença absoluta em segundos

    // Adiciona a pontuação à lista local
    _pontuacoes.add(pontos);

    // Atualiza o Firestore com a nova pontuação
    await firestoreDB.collection("Equipe").doc(_equipeId).update({
      'pontuacoes': FieldValue.arrayUnion([pontos]), // Adiciona a pontuação ao Firestore
    });

    return pontos;
  } else {
    throw Exception("Não há pontos suficientes registrados para calcular a pontuação.");
  }
}
