import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_feild.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormFeild(
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              CustomTextFormFeild(
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomTextFormFeild(
                hintText: 'Product Code ',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomTextFormFeild(
                maxLines: 5,
                hintText: 'Product Description',
                textInputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
