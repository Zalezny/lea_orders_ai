import 'package:flutter/material.dart';
import 'package:lea_orders_ai/presentation/navigation/navigation_scaffold.dart';
import 'settings/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lea Orders AI',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), useMaterial3: false),
      home: const NavigationScaffold(),
    );
  }
}
