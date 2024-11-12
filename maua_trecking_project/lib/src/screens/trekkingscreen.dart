import 'package:flutter/material.dart';
import 'package:maua_trecking_project/src/mixins/popup_info_mixin.dart';
import '../back_end/storage.dart';

class TrekkingScreen extends StatefulWidget {
  const TrekkingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TrekkingScreenState();
  }
}

class TrekkingScreenState extends State<TrekkingScreen> with InfoPopUp {
  final StorageService _storageService = StorageService();
  String? _imageUrl; // Variável para armazenar o URL da imagem

  @override
  void initState() {
    super.initState();
    _loadImage(); // Chama o método para carregar a imagem ao iniciar
  }

  // Método para carregar a imagem do Firebase Storage
  Future<void> _loadImage() async {
    try {
      String url = await _storageService.getDownload(); // Obtém o URL da imagem
      setState(() {
        _imageUrl = url; // Atualiza a variável com o URL da imagem
      });
    } catch (e) {
      print("Erro ao carregar a imagem: $e"); // Em caso de erro
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 71, 133),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 223, 223, 223),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  infoPopup(context, screenHeight, screenWidth);
                },
                icon: const Icon(
                  Icons.info,
                  color: Color.fromARGB(255, 0, 71, 133),
                )),
          )
        ],
      ),
      body: Center(
        child: _imageUrl != null
            ? Image.network(_imageUrl!) // Exibe a imagem quando o URL estiver carregado
            : const CircularProgressIndicator(), // Exibe um indicador de carregamento enquanto o URL está sendo carregado
      ),
    );
  }
}
