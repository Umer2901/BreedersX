import 'package:flutter/material.dart';
import 'package:breedex/constants/colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final Function()? onTap;
  final String? initialValue;
  final bool readOnly;
  final Color fillColor;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final VoidCallback? onEditComplete;
  final int maxLines;
  final int? minLines;
  final TextInputType keyboardType;
  final bool enableBorder; 

  const CustomTextField({
    super.key,
    required this.name,
    required this.hintText,
    required this.enableBorder,
    this.onEditComplete,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.validator,
    this.initialValue,
    this.textInputAction = TextInputAction.done,
    this.onTap,
    required this.fillColor,
    this.readOnly = false,
    this.keyboardType = TextInputType.name,
    this.maxLines = 1,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: FormBuilderTextField(
        textInputAction: textInputAction,
        validator: validator,
        controller: controller,
        onEditingComplete: onEditComplete,
        onChanged: onChanged,
        onTap: onTap,
        name: name,
        readOnly: readOnly,
        initialValue: initialValue,
        style: Theme.of(context).textTheme.bodyMedium, 
        cursorColor: AppColors.grey,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium 
              ?.copyWith(letterSpacing: 1, color: AppColors.darkGrey.withOpacity(0.5)),
          fillColor: fillColor,
          filled: true,
          enabled: true,
          enabledBorder: enableBorder ? AppColors.enableBorder : InputBorder.none, 
          focusedBorder: enableBorder ? AppColors.kFocuseBorder : InputBorder.none, 
          errorBorder: AppColors.kErrorOutlineBorder,
          focusedErrorBorder: AppColors.kErrorOutlineBorder,
        ),
      ),
    );
  }
}
