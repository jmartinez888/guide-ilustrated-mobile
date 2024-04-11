import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/class/class.dart';
import 'package:species/src/domain/entities/family/family.dart';
import 'package:species/src/domain/entities/kindom/kindom.dart';
import 'package:species/src/domain/entities/order/order.dart';
import 'package:species/src/domain/entities/phylum/phylum.dart';

class TaxonomyTableSection extends StatelessWidget {
  final Color mainColor;
  final Color opaqueColor;
  final Kingdom? kingdom;
  final Phylum? phylum;
  final ClassC? classC;
  final OrderC? order;
  final Family? family;
  const TaxonomyTableSection({
    Key? key,
    required this.mainColor,
    required this.opaqueColor,
    this.kingdom,
    this.phylum,
    this.classC,
    this.order,
    this.family,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customDivider = Divider(
      height: 1.5,
      thickness: 1.5,
      color: mainColor,
      indent: 8.0,
      endIndent: 8.0,
    );
    Widget doubleListTile({
      String? firstText,
      String? secondText,
      Color? divideColor,
      Color? backgroundColor,
      TextStyle? style,
    }) {
      const padding = EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0);
      return Material(
        color: backgroundColor ?? Colors.transparent,
        child: Row(
          children: [
            if (firstText != null)
              Expanded(
                child: Container(
                  padding: padding,
                  child: Text(
                    firstText,
                    style: style,
                  ),
                ),
              ),
            if (divideColor != null)
              Container(
                height: 24.0,
                width: 1.5,
                color: divideColor,
              ),
            if (secondText != null)
              Expanded(
                child: Container(
                  padding: padding,
                  child: Text(
                    secondText,
                    style: style,
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          width: 2,
          color: mainColor,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          doubleListTile(
            firstText: 'Información taxonómica',
            backgroundColor: opaqueColor,
            style: textTheme.titleLarge?.copyWith(
              color: mainColor,
            ),
          ),
          Divider(
            height: 2.0,
            thickness: 2.0,
            color: mainColor,
          ),
          doubleListTile(
            firstText: 'Reino',
            secondText: kingdom?.name ?? '-',
            divideColor: mainColor,
            style: textTheme.labelLarge,
          ),
          customDivider,
          doubleListTile(
            firstText: 'Filo',
            secondText: phylum?.name ?? '-',
            divideColor: mainColor,
            style: textTheme.labelLarge,
          ),
          customDivider,
          doubleListTile(
            firstText: 'Clase',
            secondText: classC?.name ?? '-',
            divideColor: mainColor,
            style: textTheme.labelLarge,
          ),
          customDivider,
          doubleListTile(
            firstText: 'Orden',
            secondText: order?.name ?? '-',
            divideColor: mainColor,
            style: textTheme.labelLarge,
          ),
          customDivider,
          doubleListTile(
            firstText: 'Familia',
            secondText: family?.name ?? '-',
            divideColor: mainColor,
            style: textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

