import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:docmanager/src/utils/locations.dart';
import 'package:docmanager/src/user/screens/login_view.dart';
import 'package:docmanager/src/splash/screens/splash_view.dart';
import 'package:docmanager/src/document/screens/search_web_view.dart';
import 'package:docmanager/src/user/screens/register_view.dart';
import 'package:docmanager/src/document/models/DocumentModel.dart';
import 'package:docmanager/src/utils/colors_app.dart';


void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return ChangeNotifierProvider(
      create: ( context ) => DocumentModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsApp.primaryColor
        ),
        initialRoute: Location.splash,
        routes: <String, WidgetBuilder>{
          Location.splash   : ( context ) => SplashView(),
          Location.login    : ( context ) => LoginView(),
          Location.web      : ( context ) => SearchWebView(),
          Location.register : ( context ) => RegisterView()
        }
      )
    );
  }
}