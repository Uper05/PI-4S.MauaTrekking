import 'package:flutter/material.dart';
import 'package:maua_trecking_project/src/mixins/popup_info_mixin.dart';
import '../back_end/storage.dart';
import 'camerascreen.dart'; // Importa a tela de câmera

class TrekkingScreen extends StatefulWidget {
  const TrekkingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return TrekkingScreenState();
  }
}

class TrekkingScreenState extends State<TrekkingScreen> with InfoPopUp {
  final StorageService _storageService = StorageService();
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      String url = await _storageService.getDownload();
      setState(() {
        _imageUrl = url;
      });
    } catch (e) {
      print("Erro ao carregar a imagem: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 71, 133),
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
            ? Image.network(_imageUrl!)
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraScreen()),
          );
        },
      ),
    );
  }
}
