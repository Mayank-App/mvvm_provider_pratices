 import 'package:clean_formate/utils/routes/routes_name.dart';
import 'package:clean_formate/utils/utils.dart';
import 'package:clean_formate/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class SplashServices {

  final userView = UserViewModel();
  Future<UserModel> getUserData()=> userView.getUser();

  void checkAuthetication(BuildContext context) async{
    getUserData().then((value) async {
      if(value.token.toString() == "null" || value.token.toString() == "" || value.token.isEmpty){
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (_)=>false);
      }
      else
      {
         // Utils.toastMessage(value.token);
          await Future.delayed(const Duration(seconds: 3));
          Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

}