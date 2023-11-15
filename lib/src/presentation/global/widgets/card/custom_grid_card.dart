import 'package:flutter/material.dart';

class CustomGridCard extends StatelessWidget {
  const CustomGridCard({
    Key? key,
    this.onTap,
    this.title,
    this.subtitle,
    this.fontStyle,
    this.actions,
    this.backgroundColor,
    this.principalColor,
    this.image,
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final Color? principalColor;
  final String? subtitle;
  final FontStyle? fontStyle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const borderRadius = BorderRadius.all(Radius.circular(16.0));
    return Material(
      color: backgroundColor ?? colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(
            color: principalColor ?? colorScheme.outline, width: 1.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: borderRadius,
              child: image,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: textTheme.bodyLarge?.copyWith(
                        color: principalColor ?? colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontStyle: fontStyle,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (actions != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          runSpacing: 8.0,
                          spacing: 8.0,
                          alignment: WrapAlignment.end,
                          children: actions!,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
