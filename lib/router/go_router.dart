import 'package:flutter_widget_compose/screens/home_screen.dart';
import 'package:flutter_widget_compose/screens/product_detail_screen.dart';
import 'package:go_router/go_router.dart';

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
    // Add other routes as needed
  ],
);
