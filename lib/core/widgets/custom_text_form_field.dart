import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/utils/app_colors.dart';
import 'package:fruit_hub_dash_bord/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/build_outline_input_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    this.onSaved,
    this.maxLines = 1,
    this.isNum = false,
  });
  final String title;
  final void Function(String?)? onSaved;
  final bool isNum;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'must add $title';
        }
        return null;
      },
      maxLines: maxLines,
      onSaved: onSaved,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        contentPadding: const EdgeInsets.all(22),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder().copyWith(
          borderSide: const BorderSide(color: Colors.green, width: 1),
        ),
        labelText: title,
        labelStyle: AppTextStyles.bold13.copyWith(
          color: AppColors.obacityGrayColor,
        ),
      ),
    );
  }
}
