import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_button.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/add_products_view.dart';

class DashbordViewBody extends StatelessWidget {
  const DashbordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductsView.routeName);
            },
            title: 'Add Product',
          ),
        ],
      ),
    );
  }
}
