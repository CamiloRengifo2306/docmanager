import 'package:flutter/material.dart';
import 'package:docmanager/src/utils/locations.dart';

class SplashView extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    
    Future.delayed( Duration( seconds : 4 ), (){

      // TODO DV: Validate user autentication to redirect.
      
      // Navigator.pushReplacementNamed( context, Location.login );
      Navigator.pushReplacementNamed( context, Location.login );
      
    } );

    return Scaffold(
      // backgroundColor: Color.fromRGBO(138, 210, 126, 1.0),
      body: Center(
        child: Image.asset( 'assets/images/logo_splash.png' )
      ),
    );
  }
}