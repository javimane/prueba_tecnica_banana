import 'package:flutter/material.dart';


class CustomInputs {

  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    
  }){
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      hintText: hint,
      labelText: label,
     
      labelStyle: TextStyle( color: Colors.black ),
      hintStyle: TextStyle( color: Colors.black ),
    );
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon
  }) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon( icon, color: Colors.black ),
      labelStyle: TextStyle( color: Colors.black ),
      hintStyle: TextStyle( color: Colors.black )
    );
  }


  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
   
  }){
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      hintText: hint,
      labelText: label,
    
      labelStyle: TextStyle( color: Colors.grey ),
      hintStyle: TextStyle( color: Colors.grey ),
    );
  }

}