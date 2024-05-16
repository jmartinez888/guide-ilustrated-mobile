import 'package:flutter/material.dart';
import 'package:species/src/generated/translations.g.dart';
import 'package:species/src/presentation/global/functions/padding_config/padding_config.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';

class FlexibleCard extends StatelessWidget {
  final Widget? image;
  final String? title;
  final String? subtitle;
  final String? description;
  final FontStyle? fontStyle;
  final List<Widget>? actions;
  final Widget? trailing;
  final Color? mainColor;
  final Color? opaqueColor;
  final void Function()? onTap;
  final void Function()? deleteFavorite;
  final int? maxLines;

  const FlexibleCard({
    super.key,
    this.image,
    this.title,
    this.subtitle,
    this.description,
    this.fontStyle,
    this.actions,
    this.trailing,
    this.mainColor,
    this.opaqueColor,
    this.onTap,
    this.deleteFavorite,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const borderRadius = BorderRadius.all(Radius.circular(16.0));

    Widget leftWidget({
      double? width,
    }) =>
        SizedBox(
          width: width ?? 320,
          height: 256.0,
          child: image,
        );

    Widget rightWidget({
      bool extraMarging = false,
    }) =>
        Padding(
          padding: PaddingConfig.allL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Padding(
                  padding: EdgeInsets.only(right: extraMarging ? 48.0 : 0.0),
                  child: Text(
                    title!,
                    style: textTheme.bodyLarge?.copyWith(
                      color: mainColor ?? colorScheme.onSurface,
                    ),
                    maxLines: maxLines,
                    overflow: maxLines != null ? TextOverflow.ellipsis : null,
                  ),
                ),
              if (subtitle != null)
                Padding(
                  padding: PaddingConfig.onlyTopS,
                  child: Text(
                    subtitle!,
                    style: textTheme.bodyMedium?.copyWith(fontStyle: fontStyle),
                    maxLines: maxLines,
                    overflow: maxLines != null ? TextOverflow.ellipsis : null,
                  ),
                ),
              if (description != null)
                Padding(
                  padding: EdgeInsets.only(right: extraMarging ? 48.0 : 0.0),
                  child: Text(
                    '${description!} ${description!}${description!}${description!}${description!}${description!}${description!}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
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
        );

    return Material(
      color: opaqueColor ?? colorScheme.onPrimary,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: mainColor ?? colorScheme.outline, width: 1.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Stack(
          children: [
            width <= 640
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      leftWidget(width: double.infinity),
                      rightWidget(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      leftWidget(),
                      Expanded(
                        child: rightWidget(extraMarging: true),
                      ),
                    ],
                  ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: CustomIconButton(
                tooltip: texts.general.removeFromFavorites,
                icon: Icons.favorite_rounded,
                iconColor: Colors.white,
                backgroundColor: mainColor,
                onPressed: deleteFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
