import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;

  const SearchTextField({
    Key? key,
    this.focusNode,
    this.onTapOutside,
    this.controller,
    required this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: TextFormField(
        focusNode: focusNode,
        onTapOutside: onTapOutside,
        controller: controller,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
