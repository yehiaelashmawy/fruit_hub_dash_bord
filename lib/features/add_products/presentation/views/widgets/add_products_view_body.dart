import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_button.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/product_entity.dart';
import 'package:fruit_hub_dash_bord/features/add_products/domain/entities/review_entity.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/image_picker_container.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/is_featured_product.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/is_organic.dart';

class AddProductsViewBody extends StatefulWidget {
  const AddProductsViewBody({super.key});

  @override
  State<AddProductsViewBody> createState() => _AddProductsViewBodyState();
}

class _AddProductsViewBodyState extends State<AddProductsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, productDescription, productCode;
  late int productPrice, expiredMonth, numberOfCalories, unitAmount;
  File? imageFile;
  bool isFeatured = false;
  bool isOrganic = false;
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
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Expiration Month',
                  isNum: true,
                  onSaved: (value) {
                    expiredMonth = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  title: 'Product Code',
                  isNum: false,
                  onSaved: (value) {
                    productCode = value!.toLowerCase();
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  isNum: true,
                  title: 'number of calories',
                  onSaved: (value) {
                    numberOfCalories = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  isNum: true,
                  title: 'unit amount',
                  onSaved: (value) {
                    unitAmount = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16),

                CustomTextFormField(
                  title: 'Product Description',
                  maxLines: 2,
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
                IsOrganic(
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
                          addProductInputEntity: ProductEntity(
                            productCode: productCode,
                            productDescription: productDescription,
                            productImage: imageFile!,
                            productName: productName,
                            reviews: [
                              ReviewEntity(
                                name: 'kled',
                                image:
                                    'https://www.google.com/imgres?q=image&imgurl=https%3A%2F%2Fimg.freepik.com%2Ffree-photo%2Fcloseup-scarlet-macaw-from-side-view-scarlet-macaw-closeup-head_488145-3540.jpg%3Fsemt%3Dais_hybrid%26w%3D740%26q%3D80&imgrefurl=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fimmagine&docid=TATFc30pz6U6-M&tbnid=g-f_n5rQ1XEy2M&vet=12ahUKEwjlpuuCy-2QAxXyAfsDHWZfOEUQM3oECBoQAA..i&w=740&h=1109&hcb=2&itg=1&ved=2ahUKEwjlpuuCy-2QAxXyAfsDHWZfOEUQM3oECBoQAA',
                                rating: 6,
                                date: DateTime.now().toString(),
                                reviewDescription: 'good product',
                              ),
                            ],
                            productPrice: productPrice,
                            isFeatured: isFeatured,
                            isOrganic: isOrganic,
                            expiredMonth: expiredMonth,
                            numberOfCalories: numberOfCalories,
                            unitAmount: unitAmount,
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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
