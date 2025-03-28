import 'package:dara/app_locator.dart';
import 'package:dara/services/product_service.dart';
import 'package:dara/views/product_details/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerSimple extends StatefulWidget {
  const BarcodeScannerSimple({super.key});

  @override
  State<BarcodeScannerSimple> createState() => _BarcodeScannerSimpleState();
}

class _BarcodeScannerSimpleState extends State<BarcodeScannerSimple> {
  bool _isScanned = false; // Simple flag to prevent duplicate scans
  MobileScannerController controller = MobileScannerController();
  Barcode? _barcode;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Aucun produit détecté',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'Aucune valeur',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) async {
    if (_isScanned) return;
    
    final barcode = barcodes.barcodes.firstOrNull;
    if (barcode?.rawValue == null || !mounted) return;

    setState(() => _isScanned = true);
    
    try {
      final product = await locator<ProductService>().getProductInfos(
        barcode: barcode!.rawValue!,
      );

      if (mounted) {
        // Stop scanner and replace current route
        
        await controller.stop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsView(
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isScanned = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _handleBarcode,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}