import 'package:dara/viewmodels/base.viewmodel.dart';

class ProductDetailsViewModel extends BaseViewModel {
  bool _showDefects = true;
  bool get showDefects => _showDefects;

  void selectDefects() {
    _showDefects = true;
    notifyListeners();
  }

  void selectQualities() {
    _showDefects = false;
    notifyListeners();
  }

  // Exemple de structure de données
  Product get product => Product(
    productName: 'Nom du produit',
    imageUrl: 'https://images.openfoodfacts.org/images/products/500/015/937/6655/front_fr.83.400.jpg',
    brand: 'Marque',
    rating: 80,
    defects: ['Défaut 1', 'Défaut 2', 'Défaut 3'],
    qualities: ['Qualité 1', 'Qualité 2', 'Qualité 3'],
  );
}

class Product {
  final String productName;
  final String imageUrl;
  final String brand;
  final double rating;
  final List<String> defects;
  final List<String> qualities;

  Product({
    required this.productName,
    required this.imageUrl,
    required this.brand,
    required this.rating,
    required this.defects,
    required this.qualities,
  });
}