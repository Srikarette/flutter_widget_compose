import 'package:flutter_widget_compose/entities/product.dart';
import 'package:flutter_widget_compose/screens/home_screen.dart';
import 'package:flutter_widget_compose/screens/product_detail_screen.dart';
import 'package:flutter_widget_compose/screens/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomePage();
    },
    routes: [
      GoRoute(
        path: 'detail',
        builder: (context, state) {
          final product = state.extra as ProductToDisplay;
          return ProductDetailScreen(product: product,);
        },
      ),
      GoRoute(
        path: 'user',
        builder: (context, state) {
          return UserProfile();
        },
      ),
        GoRoute(
        path: 'home',
        builder: (context, state) {
          return HomePage();
        },
      ),
    ]
  ),

]);