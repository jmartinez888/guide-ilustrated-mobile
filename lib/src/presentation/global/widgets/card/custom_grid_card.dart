import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';

class CustomGridCard extends StatelessWidget {
  const CustomGridCard({
    Key? key,
    this.onTap,
    this.title,
    this.subtitle,
    this.fontStyle,
    this.actions,
    this.opaqueColor,
    this.mainColor,
    this.image,
    this.maxLines,
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final String? subtitle;
  final FontStyle? fontStyle;
  final List<Widget>? actions;
  final Color? mainColor;
  final Color? opaqueColor;
  final void Function()? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const borderRadius = BorderRadius.all(Radius.circular(16.0));
    return Material(
      color: opaqueColor ?? colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: mainColor ?? colorScheme.outline, width: 1.0),
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
              padding: PaddingConfig.allL,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: textTheme.bodyLarge?.copyWith(
                        color: mainColor ?? colorScheme.onSurface,
                      ),
                      maxLines: maxLines,
                      overflow: maxLines != null ? TextOverflow.ellipsis : null,
                    ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontStyle: fontStyle,
                      ),
                      maxLines: maxLines,
                      overflow: maxLines != null ? TextOverflow.ellipsis : null,
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
