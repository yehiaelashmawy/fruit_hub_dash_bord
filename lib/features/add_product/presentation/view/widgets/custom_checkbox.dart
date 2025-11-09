import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.isCheked,
    required this.onChanged,
  });
  final bool isCheked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isCheked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isCheked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isCheked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        duration: Duration(milliseconds: 100),

        child: isCheked
            ? Center(child: Icon(Icons.check, color: Colors.white))
            : SizedBox(),
      ),
    );
  }
}
