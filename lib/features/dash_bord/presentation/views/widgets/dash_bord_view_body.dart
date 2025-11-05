import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_button.dart';

class DashBordViewBody extends StatelessWidget {
  const DashBordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CustomButton(onPressed: () {}, text: 'Add Product')],
      ),
    );
  }
}
