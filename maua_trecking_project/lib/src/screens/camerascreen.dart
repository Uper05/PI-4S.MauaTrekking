import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart'; // Pacote para abrir links

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late MobileScannerController scannerController;

  @override
  void initState() {
    super.initState();
    scannerController = MobileScannerController();
  }

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final Barcode? barcode = capture.barcodes.firstOrNull;
    if (barcode != null && barcode.rawValue != null) {
      final String code = barcode.rawValue!;
      print("Código QR detectado: $code");

      // Tenta abrir o URL detectado
      _launchURL(code);
    }
  }

  // Função para tentar abrir o URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Cria o objeto Uri a partir do URL

    try {
      await launchUrl(uri); // Tenta abrir o link diretamente
    } catch (e) {
      // Exibe uma mensagem de erro se não for possível abrir o link
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Não foi possível abrir o link.")),
      );
      print("Erro ao tentar abrir o link: $uri, $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 223, 223, 223), //change your color here
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        title: const Text(
          "Escanear QR Code",
          style: TextStyle(
              color: Color.fromARGB(255, 223, 223, 223),
              fontVariations: [FontVariation('wght', 600.0)]),
        ),
      ),
      body: MobileScanner(
        controller: scannerController,
        onDetect: _onDetect,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scannerController.toggleTorch();
        },
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        child: const Icon(
          Icons.flash_on,
          color: Color.fromARGB(255, 223, 223, 223),
        ),
      ),
    );
  }
}
