
import 'package:clean_formate/utils/routes/routes_name.dart';
import 'package:clean_formate/view/home_view.dart';
import 'package:clean_formate/view/login_view.dart';
import 'package:clean_formate/view/sign_up.dart';
import 'package:clean_formate/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder:(BuildContext context)=>SignUp());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No routes are there"),
            ),
          );
        });
    }

  }
}