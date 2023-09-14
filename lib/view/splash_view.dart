import 'package:clean_formate/view_model/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashView extends StatefulWidget{
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
   SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthetication(context);
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(

         body:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
              Center(child: Text("Splash Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),))
           ],

         ),

   );
  }
}