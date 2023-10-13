import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final void Function()? onTap;
  final Color? background;
  final Widget? leading;
  final String? title;
  final Color? titleColor;
  final Widget? trailing;

  const CustomListTile({
    Key? key,
    this.onTap,
    this.background,
    this.leading,
    this.title,
    this.titleColor,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(100.0);
    final textTheme = Theme.of(context).textTheme;

    return Material(
      borderRadius: borderRadius,
      color: background,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: leading,
                ),
              Expanded(
                child: Text(
                  title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelLarge?.copyWith(color: titleColor),
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: trailing,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
