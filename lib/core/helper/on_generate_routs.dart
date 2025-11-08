import 'package:flutter/material.dart';
import '../../features/add_product/presentation/view/add_product_view.dart';
import '../../features/dash_bord/presentation/views/dash_bord_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBordView.routeName:
      return MaterialPageRoute(builder: (context) => const DashBordView());

    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
