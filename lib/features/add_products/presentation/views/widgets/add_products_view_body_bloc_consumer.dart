import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/add_products_view_body.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/custom_progress_hud.dart';

class AddProductsViewBodyBlocConsumer extends StatelessWidget {
  const AddProductsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product Added Successfully!')),
          );
        }
        if (state is AddProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: const AddProductsViewBody(),
        );
      },
    );
  }
}
