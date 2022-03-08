import 'package:flutter/material.dart';
import '../constants/colors/colors.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hintText,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final List<String> items;
  final String hintText;
  final void Function(String?) onChanged;
  final Widget? suffixIcon;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items.map(
        (String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          );
        },
      ).toList(),
      onChanged: onChanged,
      value: value,
      validator: validator,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.primaryColor,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffB8B8B8),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
