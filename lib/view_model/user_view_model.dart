import 'package:clean_formate/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier{
   Future<bool> saveUser(UserModel user) async{
     final SharedPreferences sp = await SharedPreferences.getInstance();
     sp.setString("token", user.token.toString());
     return true ;
   }

   Future<UserModel> getUser() async{

     final SharedPreferences sp = await SharedPreferences.getInstance();
     String ?token = sp.getString("token");
     return UserModel(token: token.toString());
   }

   Future<bool> removeUser() async{
     final SharedPreferences sp = await SharedPreferences.getInstance();
     return sp.clear();
   }
}