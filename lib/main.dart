import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_widget_compose/getit/get_dart.dart';
import 'package:flutter_widget_compose/screens/home_screen.dart';
import 'package:flutter_widget_compose/screens/product_detail_screen.dart';

void main() {
  registerServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}); 
  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final productId = state.pathParameters['id']; 
          return ProductDetailScreen(productId: productId!);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter, // Set the GoRouter configuration
    );
  }
}
