import 'package:flutter/material.dart';
import '../back_end/firestore.dart';

class CalcularPontosScreen extends StatefulWidget {
  const CalcularPontosScreen({super.key});

  @override
  State<CalcularPontosScreen> createState() => _CalcularPontosState();
}

class _CalcularPontosState extends State<CalcularPontosScreen> {
  @override
  void initState() {
    super.initState();
    _executarFuncoes(); // Chama as funções ao abrir a página
  }

  Future<void> _executarFuncoes() async {
    try {
      await registrarHora();  // Registra o horário
      await calcularPontos();  // Calcula e registra os pontos

      // Após executar as funções, retorna para a tela de trekking
      Navigator.pushNamed(context, '/telaTrekking');
    } catch (e) {
      print("Erro ao executar funções: $e");
      // Adicione lógica de erro, como exibir um snackbar se necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    // Página intermediária sem interface visível
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Exibe um loading enquanto executa
      ),
    );
  }
}
