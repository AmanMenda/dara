// A utility class that defines the route paths used in the application.
/// 
/// This class contains static constants representing the routes for different screens.
/// It is used to centralize route management and avoid hardcoding strings throughout the app
class RoutePaths {
  RoutePaths._(); // Private constructor to prevent instantiation.

  /// The route path for the startup screen.
  static const String startup = '/';

  /// The route path for the scanned products history
  static const String scannedProductsHistory = '/history';

  /// The route path for the login screen.
  static const String login = '/login';

  /// The route path for the register screen.
  static const String register = '/register';

  /// The route path for the product detail screen.
  static const String productDetail = '/details';
}