import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          SizedBox( height: 20 ),

          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Bienvenido',
              style: GoogleFonts.montserratAlternates(
                fontSize: 60,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}