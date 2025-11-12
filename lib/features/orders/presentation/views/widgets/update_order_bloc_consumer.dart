import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/custom_progress_hud.dart';
import 'package:fruit_hub_dash_bord/features/orders/presentation/manager/update_order/update_order_cubit.dart';

class UpdateOrderBlocConsumer extends StatelessWidget {
  const UpdateOrderBlocConsumer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          customSnackBar(context, message: 'Order Updated Successfully!');
        }
        if (state is UpdateOrderFailure) {
          customSnackBar(context, message: 'Error exists in ${state.message}');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
