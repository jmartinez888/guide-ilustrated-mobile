// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int totalLevels;
  final int currentLevel;

  const ProgressBar({
    Key? key,
    required this.totalLevels,
    required this.currentLevel,
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding), 
      child: Column(
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalLevels, (index) {
              bool isCompleted = index < currentLevel;
              bool isCurrent = index == currentLevel - 1;
              Color circleColor = isCompleted
                  ? Theme.of(context).colorScheme.tertiary
                  : (isCurrent
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant);
              Color lineColor = isCompleted
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.outline;

              return Padding(
                padding: EdgeInsets.only(bottom: textSpacing),
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
            }),
          ),

          
          Stack(
            alignment: Alignment.center,
            children: [
             
             Container(
                  width: double.infinity,
                  height: lineHeight,
                  color: Theme.of(context).colorScheme.outline,
                ),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(totalLevels, (index) {
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
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
