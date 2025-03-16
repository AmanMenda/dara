import 'package:dara/theme/colors.dart';
import 'package:dara/viewmodels/history_viewmodel.dart';
import 'package:dara/views/history/widgets/barcode_scanner_simple.dart';
import 'package:dara/views/shared/history_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dara/theme/sizes.dart';

import 'package:dara/views/base.view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HistoryViewModel>(
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.medium),
          child: Center(
            child: ProductCard(
              imageUrl: 'https://example.com/product.jpg',
              productName: 'Smartphone XYZ',
              brand: 'TechBrand',
              timeSinceScanned: 'il y a 2 jours',
              rating: 4.2,
              onTap: () {
                // Navigation vers la page de détails
              },
            )
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BarcodeScannerSimple(),
              )
            );
          },
          icon: SvgPicture.asset(
            "assets/icons/barcode-scan.svg"
          ),
          label: Text(
            'Scanner',
            style: GoogleFonts.cabin(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: FontSizes.bodyLarge
            )
          ),
          backgroundColor: Colors.green,
          elevation: 4,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}