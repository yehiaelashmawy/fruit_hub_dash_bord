import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/widgets/custom_button.dart';
import 'package:fruit_hub_dash_bord/features/add_product/domin/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dash_bord/features/add_product/presentation/view/widgets/is_featured_cheackbox.dart';
import '../../../../../core/widgets/custom_text_form_feild.dart';
import 'image_felid.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price;
  bool isFeatured = false;
  File? image;
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
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              CustomTextFormFeild(
                onSaved: (value) {
                  if (num.tryParse(value!) != null) {
                    price = num.parse(value);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid number'),
                      ),
                    );
                  }
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomTextFormFeild(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code ',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomTextFormFeild(
                onSaved: (value) {
                  description = value!;
                },
                maxLines: 5,
                hintText: 'Product Description',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              IsFeaturdCheackBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 20),

              ImageFelid(
                onFileChange: (file) {
                  image = file;
                },
              ),

              SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // ignore: unused_local_variable
                      AddProductInputEntity inputEntity = AddProductInputEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        isFeatured: isFeatured,
                        image: image!,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      });
                    }
                  } else {
                    showErrorBar(context);
                  }
                },
                text: 'Save',
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
