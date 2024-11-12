import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> getDownload() async {
    try {
      // Especifica diretamente o nome do arquivo
      String url = await storage.ref("teste.jpg").getDownloadURL();
      return url;
    } catch (e) {
      print("Erro ao obter o URL: $e");
      rethrow;
    }
  }
}

