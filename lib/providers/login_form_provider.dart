import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String username    = '';
  String password = '';

  bool validateForm() {

    if ( formKey.currentState!.validate() ) {
       print('Form valid ... Login');
       print('$username === $password');
      return true;
    } else {
      // print('Form not valid');
      return false;
    }

  }


}