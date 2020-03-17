import 'package:flutter/material.dart';
import 'package:docmanager/src/utils/locations.dart';
import 'package:docmanager/src/utils/strings_app.dart';
import 'package:docmanager/src/utils/colors_app.dart';

class RegisterView extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    double widthView = MediaQuery.of( context ).size.width;
    double heightView = MediaQuery.of( context ).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text( StringsApp.login_app_bar ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child : Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox( height : heightView * 0.09 ),
              _getLogoImage( widthView, heightView ),
              SizedBox( height : heightView * 0.05 ),
              _getTitle( StringsApp.register_title ),
              SizedBox( height : heightView * 0.05 ),
              _addTextField( 
                Icon( Icons.account_circle ),
                StringsApp.register_name, 
                false, 
                widthView, 
                heightView ),
              SizedBox( height : heightView * 0.05 ),
              _addTextField( 
                Icon( Icons.account_circle ),
                StringsApp.register_last_name, 
                false, 
                widthView, 
                heightView ),
              SizedBox( height : heightView * 0.05 ),
              _addTextField( 
                Icon( Icons.directions ),
                StringsApp.register_direction, 
                false, 
                widthView, 
                heightView ),
              SizedBox( height : heightView * 0.05 ),
              _addTextField( 
                Icon( Icons.phone ),
                StringsApp.register_phone, 
                false, 
                widthView, 
                heightView ),
              SizedBox( height : heightView * 0.05 ),
              _addTextField( 
                Icon( Icons.email ),
                StringsApp.login_email, 
                false, 
                widthView, 
                heightView ),
              SizedBox( height : heightView * 0.05 ),
              _addTextField(
                Icon( Icons.lock_open ),
                StringsApp.login_pass,
                true,
                widthView,
                heightView 
              ),
              SizedBox( height : heightView * 0.09 ),
              _getEnterButton( context, widthView, heightView )
            ],
          )
        )
      )
    );
  }

  
  ///Return the fragment of the App's logo.
  ///@author Dv
  Widget _getLogoImage( double width, double height ) {
    return Container(
            width: width * 0.40,
            height: height * 0.25,
            decoration: BoxDecoration(
              shape : BoxShape.circle,
              color : Colors.white,
              image : DecorationImage(
                fit : BoxFit.fill,
                image: Image.asset( 'assets/images/logo_splash.png' ).image
                // image : Image.network( 'https://lh3.googleusercontent.com/proxy/INrayfWh7Eelfn0GXrCPrx4mET9JA5re8NsySsxtV_j1zLm3ErG12Cuz1OfukoeOpwD62Ic7Up7WHzsA5_Fp3HIRDPhARO_AJ3LMt5mZR45J4wwqVg-jzsXC0GwlPAYmBZbQEtHf-YkeMn3cdC-OMk9R6atfELB7JtGzVxqg8ePL8ZfN' ).image
              ),
              // border : BoxBorder.lerp(a, b, t)
            ),
    );
  }

  ///Return title of the view.
  ///@author Dv
  Widget _getTitle( String text ) {
    return Text(
      text,
      style: TextStyle(
        fontSize : 16,
        fontWeight: FontWeight.bold
      ),
    );
  }

  ///Add a TextField with parameters in.
  ///@author Dv
  Widget _addTextField( Icon icon, String text, bool hidden, double width, double height ) {
    return Container(
        width: width * 0.7,
        height: height * 0.06,
        child: TextField(
          obscureText: hidden,
          decoration: InputDecoration(
            prefixIcon: icon,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              fontSize: 12
            ),
            labelText: text
          ),
        ),
    );
  }

  ///Add button to autenticate user.
  ///@author Dv
  Widget _getEnterButton( BuildContext context, double width, double heigt ) {
    return RaisedButton(
              color: ColorsApp.primaryColor,
              textColor: ColorsApp.secondaryColor,
              child: Container(
                width: width * 0.40,
                child : Center(
                  child: Text( 
                    StringsApp.register_create,
                    style: TextStyle(
                      fontSize: 9
                    ),
                ),
                )
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              ),
              onPressed: () => Navigator.pushNamed( context, Location.search )
            );
  }
}