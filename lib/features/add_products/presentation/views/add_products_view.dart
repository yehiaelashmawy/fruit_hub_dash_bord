import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dash_bord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dash_bord/core/services/get_it_services.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/add_products_view_body_bloc_consumer.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddProductCubit(getIt.get<ImageRepo>(), getIt.get<ProductRepo>()),
      child: const Scaffold(body: AddProductsViewBodyBlocConsumer()),
    );
  }
}
