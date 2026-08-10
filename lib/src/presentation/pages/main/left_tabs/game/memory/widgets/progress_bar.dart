// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int totalLevels;
  final int currentLevel;

  final Axis axis;

  const ProgressBar({
    Key? key,
    required this.totalLevels,
    required this.currentLevel,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double circleSize = screenHeight * 0.02; 
    double lineHeight = screenHeight * 0.005; 
    double textSize = screenHeight * 0.015; 
    double textSpacing = screenHeight * 0.01; 
    double padding = screenWidth * 0.1; 
    
    bool isVertical = axis == Axis.vertical;

    List<Widget> textWidgets = List.generate(totalLevels, (index) {
      bool isCompleted = index < currentLevel;
      bool isCurrent = index == currentLevel - 1;
      Color lineColor = isCompleted
          ? Theme.of(context).colorScheme.tertiary
          : Theme.of(context).colorScheme.outline;

      return Padding(
        padding: isVertical 
            ? EdgeInsets.only(left: textSpacing) 
            : EdgeInsets.only(bottom: textSpacing),
        child: isCurrent
            ? Text(
                'Nivel ${index + 1}',
                style: TextStyle(
                  fontSize: textSize,
                  color: lineColor,
                ),
              )
            : SizedBox.shrink(), 
      );
    });
    
    Widget textLayer = isVertical 
      ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: textWidgets,
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: textWidgets,
        );

    Widget lineLayer = Container(
      width: isVertical ? lineHeight : double.infinity,
      height: isVertical ? double.infinity : lineHeight,
      color: Theme.of(context).colorScheme.outline,
    );

    List<Widget> dotWidgets = List.generate(totalLevels, (index) {
      bool isCompleted = index < currentLevel;
      bool isCurrent = index == currentLevel - 1;
      Color circleColor = isCompleted
          ? Theme.of(context).colorScheme.tertiary
          : (isCurrent
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline);

      return Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
          border: isCurrent
              ? Border.all(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  width: 2,
                )
              : null,
        ),
      );
    });

    Widget dotsLayer = isVertical
      ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dotWidgets,
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dotWidgets,
        );

    Widget visualLayer = Stack(
      alignment: Alignment.center,
      children: [
        lineLayer,
        dotsLayer,
      ],
    );

    return Padding(
      padding: isVertical
          ? EdgeInsets.symmetric(vertical: screenHeight * 0.05)
          : EdgeInsets.symmetric(horizontal: padding), 
      child: isVertical
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                visualLayer,
                SizedBox(width: 8),
                textLayer,
              ],
            )
          : Column(
              children: [
                textLayer,
                visualLayer,
              ],
            ),
    );
  }
}
