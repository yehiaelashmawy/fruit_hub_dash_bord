import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/services/get_it_service.dart';
import 'package:fruit_hub_dash_bord/features/add_product/manager/cubit/add_product_cubit.dart';

import '../../../../core/repos/images_repo/imagrs_repo.dart';
import '../../../../core/repos/products_repo/product_repo.dart';
import '../../../../core/widgets/build_app_bar.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(getIt.get<ImagesRepo>(), getIt.get<ProducstRepo>()),
        child: AddProductViewBody(),
      ),
    );
  }
}
