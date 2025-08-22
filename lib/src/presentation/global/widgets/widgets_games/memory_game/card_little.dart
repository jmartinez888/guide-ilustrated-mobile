import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CardLittle extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final bool revealed; // 🔹 Ahora depende de MemoryTable, no local

  const CardLittle({
    Key? key,
    this.imagePath,
    this.title,
    required this.revealed, // 🔹 obligatorio
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: 0, // 🔹 elevación agregada
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: screenWidth * 0.32,
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01,
          horizontal: screenWidth * 0.02,
        ),
        child: Stack(
          children: [
      
     
          if (!revealed)
            Container(
              width: screenWidth * 0.32,
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black, // 🔹 Color del borde
                  width: 3,           // 🔹 Grosor de 2px
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/memory/icon/frutaiconcard.webp",
                  fit: BoxFit.fill,
                  width: screenWidth * 0.32,
                  height: screenHeight * 0.15,
                ),
              ),
            ),

          // 🔹 Estado revelada (imagen o animación)
          if (revealed)
            Container(
              width: screenWidth * 0.32,
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black, 
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imagePath != null
                    ? imagePath!.endsWith(".svg")
                        ? SvgPicture.asset(
                            imagePath!,
                            fit: BoxFit.fill,
                            width: screenWidth * 0.32,
                            height: screenHeight * 0.15,
                          )
                        : imagePath!.endsWith(".json")
                            ? Lottie.asset(
                                imagePath!,
                                fit: BoxFit.fill,
                                width: screenWidth * 0.32,
                                height: screenHeight * 0.15,
                              )
                            : Image.asset(
                                imagePath!,
                                fit: BoxFit.fill,
                                width: screenWidth * 0.32,
                                height: screenHeight * 0.15,
                              )
                    : Center(
                        child: Text(
                          'No disponible',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                      ),
              ),
            ),


            // 🔹 Título (solo revelada)
            if (revealed)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.01,
                  ),
                  child: Text(
                    title ?? 'No disponible',
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
