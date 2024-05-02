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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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

/* SizedBox(
          height: 56.0,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              fillColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Buscar autor',
            ),
            onChanged: (value) => setState(() {
              searchController.text = value;
              _pagingController.refresh();
            }),
          ),
        ) */