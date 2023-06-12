

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/login_form_provider.dart';
import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    
    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: ( context ){

        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);


        return Container(
        margin: EdgeInsets.only(top: 340),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints( maxWidth: 400),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: loginFormProvider.formKey,
              child: Column(
                children: [
                  
                  // UserName
                  TextFormField(
                    onFieldSubmitted: ( _ ) => onFormSubmit( loginFormProvider, authProvider ),
                
                    onChanged: ( value ) => loginFormProvider.username = value,
                    style: TextStyle( color: Colors.black ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su UserName',
                      label: 'UserName',
                  
                    ),
                  ),

                  SizedBox( height: 20 ),

                  // Password
                  TextFormField(
                    onFieldSubmitted: ( _ ) => onFormSubmit( loginFormProvider, authProvider ),
                    onChanged: ( value ) => loginFormProvider.password = value,
                    validator: ( value ) {
                      if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                      if ( value.length < 6 ) return 'La contraseña debe de ser de 6 caracteres';

                      return null; // Válido
                    },
                    obscureText: true,
                    style: TextStyle( color: Colors.black),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: '*********',
                      label: 'Contraseña',
                  
                    ),
                  ),
                  
                  SizedBox( height: 40),
                  CustomOutlinedButton(
                    onPressed: () => onFormSubmit( loginFormProvider, authProvider ), 
                    text: 'Ingresar',
                  ),

                ],
              )
            ),
          ),
        ),
      );
      })
    );
  }

  void onFormSubmit(LoginFormProvider loginFormProvider, AuthProvider authProvider ) {
    final isValid = loginFormProvider.validateForm();
    if ( isValid )
      authProvider.login(loginFormProvider.username, loginFormProvider.password);
  }

}