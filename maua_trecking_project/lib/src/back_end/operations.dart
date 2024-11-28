import 'firestoreEquipe.dart';

//instâncias de variáveis
List<DateTime> _horariosPontos = [];  // Lista de horários do usuário
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

// Função para registrar o horário inicial
Future<void> registrarHora() async {
  if (getEquipeId() == null) {
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
Future<void> calcularPontos() async {
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

    // Atualiza o Firestore com a nova pontuação
    await atualizarPontuacao(pontos);

  } else {
    throw Exception("Não há pontos suficientes registrados para calcular a pontuação.");
  }
}