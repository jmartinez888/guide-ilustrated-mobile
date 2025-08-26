// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:stroke_text/stroke_text.dart';

class CardLittle extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final bool revealed;

  const CardLittle({
    Key? key,
    this.imagePath,
    this.title,
    required this.revealed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final double cardWidth = screenWidth * 0.1;
    final double cardHeight = screenHeight * 0.1;
    

    Widget _buildAssetExpanded() {
      if (imagePath == null) {
        return SizedBox.expand(
          child: Center(
            child: Text(
              'No disponible',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: screenHeight * 0.018,
              ),
            ),
          ),
        );
      }

      if (imagePath!.endsWith(".svg")) {
        return SizedBox.expand(
          child: SvgPicture.asset(
            imagePath!,
            fit: BoxFit.fill,
          ),
        );
      } else if (imagePath!.endsWith(".json")) {
        return SizedBox.expand(
          child: Lottie.asset(
            imagePath!,
            fit: BoxFit.fill,
          ),
        );
      } else {
        return SizedBox.expand(
          child: Image.asset(
            imagePath!,
            fit: BoxFit.fill,
          ),
        );
      }
    }

    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // Contorno de 2 px negro al contenedor principal
          border: Border.all(color: Colors.black, width: 3),
        ),
    
        child: ClipRRect(
    
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
   
              if (!revealed)
                const Positioned.fill(
                  child: _CardBack(),
                )
              else
                Positioned.fill(child: _buildAssetExpanded()),

       
              if (revealed)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: cardHeight * 0.15,
                      horizontal: screenWidth * 0.01,
                    ),
                 
              
                         child: StrokeText(
                      text: title ?? 'No disponible',
                      strokeWidth: 4,
                      strokeColor: Theme.of(context).colorScheme. onSurface,
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: screenHeight * 0.022,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/memory/icon/frutaiconcard.webp",
      fit: BoxFit.fill,
    );
  }
}
