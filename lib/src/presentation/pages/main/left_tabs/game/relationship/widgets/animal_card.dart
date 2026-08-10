import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/utils/responsive.dart';

class AnimalCard extends StatelessWidget {
  final String animal;
  final String imagePath;
  final Responsive responsive;
  final bool isDragging;

  const AnimalCard({
    Key? key,
    required this.animal,
    required this.imagePath,
    required this.responsive,
    this.isDragging = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0), // Light orange
        borderRadius: BorderRadius.circular(15),
        boxShadow: isDragging
            ? [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
            : [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ],
        border: Border.all(
          color: Colors.orange.shade300,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange.shade300,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              animal,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.dp(1.0),
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
