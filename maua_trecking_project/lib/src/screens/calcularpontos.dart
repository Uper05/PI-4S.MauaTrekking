import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../back_end/operations.dart';
import '../back_end/firestoreEquipe.dart';

class CalcularPontosScreen extends StatefulWidget {
  const CalcularPontosScreen({super.key});

  @override
  State<CalcularPontosScreen> createState() => _CalcularPontosState();
}

class _CalcularPontosState extends State<CalcularPontosScreen> {
  bool _executando = false; // Controla a execução para evitar duplicações

  @override
  void initState() {
    super.initState();
    _executarFuncoes(); // Chama as funções quando a tela é aberta
  }

  Future<void> _executarFuncoes() async {
    if (_executando) return; // Evita execuções simultâneas
    setState(() {
      _executando = true; // Marca como em execução
    });

    try {
      // Funções de backend
      await registrarHora(); 
      await calcularPontos();

      // Verifica se a pontuação já chegou a 7 e finaliza o jogo
      if (await getTamanhoPontuacao() == 7) {
        // Exibe o Toast de finalização
        Fluttertoast.showToast(
          msg: "Jogo finalizado! Você completou todas as etapas.\nRetorne imediatamente à sua sala de aula e aguarde o resultado.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          textColor: Colors.white,
          fontSize: 18.0,
        );

        // Fecha o pop-up caso esteja aberto
        if (Navigator.canPop(context)) {
          Navigator.pop(context); // Fecha o diálogo ativo (se existir)
        }

        // Retorna à primeira tela
        Navigator.popUntil(context, (route) => route.isFirst); // Volta para a primeira tela
        return; // Garante que não continuará para fechar a tela atual
      }

      // Exibe o Toast ao finalizar
      Fluttertoast.showToast(
        msg: "Pontos salvos com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Após executar, retorna à tela anterior
      if (mounted) {
        Navigator.pop(context); // Retorna à tela anterior (ex.: câmera)
      }
    } catch (e) {
      print("Erro ao executar funções: $e");
      // Mostra erro opcional
      Fluttertoast.showToast(
        msg: "Erro ao salvar pontos!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      if (mounted) {
        setState(() {
          _executando = false; // Libera para uma nova execução
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Mostra loading enquanto executa
      ),
    );
  }
}