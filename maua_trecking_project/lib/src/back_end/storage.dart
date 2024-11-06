import 'package:firebase_storage/firebase_storage.dart';

class StorageService {

  final FirebaseStorage storage = FirebaseStorage.instance;
  String pathService = "/mapas";

  Future <String> getDownload ({required String fileName, required String tipoMapa}) async{
    return await storage.ref("$pathService/$tipoMapa/$fileName.png").getDownloadURL();
  }
}