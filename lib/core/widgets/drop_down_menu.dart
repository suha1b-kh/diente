import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    this.icon,
    required this.items,
    required this.selectedItem,
    required this.onChanged, required String? Function(String? value) validator,
  });

  final double width, height;
  final String text;
  final IconData? icon;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                  context,
                  text,
                  Theme.of(context).colorScheme.inversePrimary,
                  14.sp,
                  FontWeight.w400),
              if (icon != null)
                Icon(
                  icon,
                  size: 24.h,
                  color: Colors.grey[600],
                ),
            ],
          ),
          icon: const Icon(Icons.arrow_drop_down_outlined),
          isExpanded: true,
          value: selectedItem,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
