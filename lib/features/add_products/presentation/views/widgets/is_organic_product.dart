import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub_dash_bord/core/utils/app_colors.dart';
import 'package:fruit_hub_dash_bord/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dash_bord/features/add_products/presentation/views/widgets/custom_check_box.dart';

class IsOrganicProduct extends StatefulWidget {
  const IsOrganicProduct({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicProduct> createState() => _IsOrganicProductState();
}

class _IsOrganicProductState extends State<IsOrganicProduct> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChanged: (value) {
            isTermsAccepted = value!;
            widget.onChanged(value);
            setState(() {});
          },
          acceptedConditions: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Is Organic Product',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
