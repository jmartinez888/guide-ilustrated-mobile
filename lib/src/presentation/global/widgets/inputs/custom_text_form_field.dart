// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    Key? key,
    this.focusNode,
    this.onTapOutside,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTapOutside: onTapOutside,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
