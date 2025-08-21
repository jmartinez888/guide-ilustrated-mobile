// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CardLittle extends StatefulWidget {
  final String? imagePath;
  final String? title;

  const CardLittle({
    Key? key,
    this.imagePath,
    this.title,
  }) : super(key: key);

  @override
  _CardLittleState createState() => _CardLittleState();
}

class _CardLittleState extends State<CardLittle> {
  bool _isCardPressed = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isCardPressed = !_isCardPressed;
        });
      },
      child: Container(
        width: screenWidth * 0.32, // 32% del ancho de la pantalla
        height: screenHeight * 0.15, // 15% del alto de la pantalla
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, 
          horizontal: screenWidth * 0.02, 
        ),
        child: Stack(
          children: [
            // Imagen de fondo
            widget.imagePath != null && !_isCardPressed
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Aplica borderRadius a la imagen
                    child: Image.asset(
                      "assets/memory/icon/frutaiconcard.webp",  // Imagen por defecto
                      fit: BoxFit.fill,
                      width: screenWidth * 0.32,
                      height: screenHeight * 0.15,
                    ),
                  )
                : widget.imagePath != null
                    ? widget.imagePath!.endsWith(".svg")
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SvgPicture.asset(
                              widget.imagePath!,
                              fit: BoxFit.fill,
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.32,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              widget.imagePath!,
                              fit: BoxFit.fill,
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.32,
                            ),
                          )
                    : Container(),

  
            if (_isCardPressed)
              Align(
                alignment: Alignment.bottomCenter, 
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02, 
                      horizontal: screenWidth * 0.01, 
                    ), // Margen horizontal
                  child: Text(
                    widget.title ?? 'No disponible',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: screenHeight * 0.022, 
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
