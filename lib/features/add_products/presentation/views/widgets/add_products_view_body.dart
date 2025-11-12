import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_button.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/image_picker_container.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/is_featured_product.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/is_organic_product.dart';

class AddProductsViewBody extends StatefulWidget {
  const AddProductsViewBody({super.key});

  @override
  State<AddProductsViewBody> createState() => _AddProductsViewBodyState();
}

class _AddProductsViewBodyState extends State<AddProductsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, productDescription, productCode;
  late int productPrice;
  File? imageFile;
  bool isFeatured = false;
  late int expiryMonths;
  bool isOrganic = true;
  late int numOfCalories;
  late num unitAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  title: 'Product Name',
                  onSaved: (value) {
                    productName = value!;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Product Price',
                  isNum: true,
                  onSaved: (value) {
                    productPrice = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Product Code',
                  onSaved: (value) {
                    productCode = value!.toLowerCase();
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Expiry Months',
                  isNum: true,
                  onSaved: (value) {
                    expiryMonths = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Num of Calories',
                  isNum: true,
                  onSaved: (value) {
                    numOfCalories = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Unit Amount',
                  isNum: true,
                  onSaved: (value) {
                    unitAmount = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Product Description',
                  maxLines: 5,
                  onSaved: (value) {
                    productDescription = value!;
                  },
                ),
                const SizedBox(height: 16),
                IsFeaturedProduct(
                  onChanged: (bool value) {
                    isFeatured = value;
                  },
                ),
                const SizedBox(height: 16),
                IsOrganicProduct(
                  onChanged: (bool value) {
                    isOrganic = value;
                  },
                ),
                const SizedBox(height: 16),
                ImagePickerContainer(
                  onImageSelected: (value) {
                    imageFile = value;
                  },
                ),
                const SizedBox(height: 16),
                CustomButton(
                  onPressed: () {
                    if (imageFile != null) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<AddProductCubit>().addProduct(
                          addProductInputEntity: AddProductInputEntity(
                            productCode: productCode,
                            productDescription: productDescription,
                            productImage: imageFile!,
                            productName: productName,
                            productPrice: productPrice,
                            isFeatured: isFeatured,
                            expiryMonths: expiryMonths,
                            numOfCalories: numOfCalories,
                            unitAmount: unitAmount,
                            isOrganic: isOrganic,
                            reviews: [],
                          ),
                        );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    } else {
                      customSnackBar(context, message: 'must add image');
                    }
                  },
                  title: 'Add Product',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
