import 'package:dara/app_locator.dart';
import 'package:dara/app_routes.dart';
import 'package:dara/constants/routes.dart';
import 'package:dara/constants/strings.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      initialRoute: RoutePaths.login,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}