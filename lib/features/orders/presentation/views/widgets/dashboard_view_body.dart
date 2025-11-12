import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_button.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/add_products_view.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.4),
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, AddProductsView.routeName);
          },
          title: 'Add Product',
        ),
        const SizedBox(height: 30),
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, OrdersView.routeName);
          },
          title: 'Show Products',
        ),
      ],
    );
  }
}
