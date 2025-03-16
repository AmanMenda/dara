import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dara/services/base.service.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

/// A service class for fetching product information using a barcode.
/// 
/// This class interacts with the OpenFoodFacts API to retrieve product details
/// based on a provided barcode.
class ProductService extends BaseService {
  ProductService() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'Dara',
      version: '1.0.0'
    );
  }

  /// Fetches product information using a barcode.
  /// 
  /// [barcode]: The barcode of the product to fetch.
  /// 
  /// Returns a [Product] object containing the product details.
  /// 
  /// Throws an [Exception] if the product is not found or if the API request fails.
  Future<Product> getProductInfos({
    required String barcode
  }) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.FRENCH,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );
    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(configuration);
  
    if (result.status == ProductResultV3.statusSuccess) {
      return result.product!;
    } else {
      throw Exception('Produit introuvable !');
    }
  }

  Future<bool> saveProductInHistory() async {
    CollectionReference history = FirebaseFirestore.instance.collection('history');
    
    try {
      await history.add({
        'barcode': '1234567890',
        'productName': 'Smartphone XYZ',
        'brand': 'TechBrand',
        'timeSinceScanned': 'il y a 2 jours',
        'rating': 4.2,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}