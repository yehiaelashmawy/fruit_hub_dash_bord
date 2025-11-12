import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/add_products_view.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductsView());

    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());

    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
