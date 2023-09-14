import 'package:clean_formate/utils/routes/routes.dart';
import 'package:clean_formate/utils/routes/routes_name.dart';
import 'package:clean_formate/view/login_view.dart';
import 'package:clean_formate/view_model/auth_view_model.dart';
import 'package:clean_formate/view_model/get_view_model.dart';
import 'package:clean_formate/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_)=> AuthViewModel() ),
          ChangeNotifierProvider(create: (_)=>UserViewModel()
          ),
          ChangeNotifierProvider(create: (_)=>GetViewModel())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute:Routes.generateRoute
      )
    );
  }
}

