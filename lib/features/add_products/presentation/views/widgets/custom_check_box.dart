import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({super.key, this.onChanged, this.acceptedConditions = false});

  final void Function(bool?)? onChanged;
  bool acceptedConditions;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 24,
      height: 24,
      child: Checkbox(
        value: widget.acceptedConditions,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Color(0xffDDDFDF), width: 1),
        ),

        onChanged: widget.onChanged,
        activeColor: AppColors.primaryColor,
        checkColor: Colors.white,
      ),
    );
  }
}
