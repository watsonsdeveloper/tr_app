import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tr_app/data/models/global_model.dart';
import 'package:tr_app/presentation/providers/global_provider.dart';
import 'package:tr_app/utils/constants/hive_constants.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class ScanIPScreen extends HookConsumerWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final globalBox = Hive.box<GlobalModel>(HiveBox.globalBox);

  ScanIPScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useState<QRViewController?>(null);
    final ip = useState<String?>(null);

    debugPrint('scan_ip_screen.dart @ ip: ${ip.value}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Store IP QR Code'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: (QRViewController qrController) {
                      controller.value = qrController;
                      qrController.scannedDataStream.listen((barcode) {
                        if (barcode.code != null && barcode.code!.isNotEmpty) {
                          qrController.pauseCamera();
                          ip.value = barcode.code;
                          ref.read(globalSNP.notifier).setIP(barcode.code!);
                          Navigator.pushReplacementNamed(context, Routes.login);
                        }
                      });
                    },
                  )),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Column(
                children: [
                  Text(ip.value ?? 'No IP'),
                  const SizedBox(height: 16),
                  const Text(
                      "1. Open Store Pick and Pack Website on your computer's browser."),
                  const Text(
                      "2. Use your phone's camera to scan the QR Code above."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
