import 'package:flutter/material.dart';
import 'package:docmanager/src/utils/locations.dart';
import 'package:docmanager/src/views/login_view.dart';
import 'package:docmanager/src/views/splash_view.dart';
import 'package:docmanager/src/views/search_view.dart';
import 'package:docmanager/src/utils/colors_app.dart';
import 'package:docmanager/src/views/register_view.dart';
import 'package:docmanager/src/views/search_web_view.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsApp.primaryColor
      ),
      initialRoute: Location.splash,
      routes: <String, WidgetBuilder>{
        Location.splash   : ( context ) => SplashView(),
        Location.login    : ( context ) => LoginView(),
        Location.search   : ( context ) => SearchView(),
        Location.register : ( context ) => RegisterView(),
        Location.web      : ( context ) => SearchWebView()
      }
    );
  }
}