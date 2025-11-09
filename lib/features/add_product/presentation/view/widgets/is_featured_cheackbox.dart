import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/utils/app_colors.dart';
import 'package:fruit_hub_dash_bord/features/add_product/presentation/view/widgets/custom_checkbox.dart';
import '../../../../../core/utils/app_text_style.dart';

class IsFeaturdCheackBox extends StatefulWidget {
  const IsFeaturdCheackBox({
    super.key,
    required this.onChanged,
    required bool isCheked,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturdCheackBox> createState() => _IsFeaturdCheackBoxState();
}

class _IsFeaturdCheackBoxState extends State<IsFeaturdCheackBox> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Is this product featured? ',
                  style: TextStyles.semiBold16.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        CustomCheckbox(
          isCheked: isTermsAccepted,
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
