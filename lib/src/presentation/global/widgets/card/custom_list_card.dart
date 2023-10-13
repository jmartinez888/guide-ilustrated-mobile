import 'package:flutter/material.dart';

class CustomListCard extends StatelessWidget {
  final void Function()? onTap;
  final Widget? image;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? more;
  final List<Widget>? content;
  const CustomListCard({
    Key? key,
    required this.onTap,
    this.image,
    this.title,
    this.subtitle,
    this.description,
    this.more,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final borderRadius = BorderRadius.circular(16.0);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline, width: 1.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Material(
        color: colorScheme.onPrimary,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    if (image != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: borderRadius,
                          child: image,
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: colorScheme.primary),
                            ),
                          if (subtitle != null)
                            Text(
                              subtitle!,
                              style: textTheme.bodyMedium,
                            )
                        ],
                      ),
                    )
                  ],
                ),
                if (description != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                          description!,
                          style: textTheme.bodyMedium
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                    ),
                  ),
                if (more != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        more!,
                        style: textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                if (content != null) const SizedBox(height: 8.0),
                if (content != null)
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.8,
                      alignment: WrapAlignment.end,
                      children: content!,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
