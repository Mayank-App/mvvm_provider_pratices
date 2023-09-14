import 'package:clean_formate/models/user_model.dart';
import 'package:clean_formate/respository/auth_respository.dart';
import 'package:clean_formate/utils/routes/routes_name.dart';
import 'package:clean_formate/utils/utils.dart';
import 'package:clean_formate/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier{

  final _myRepo = AuthRespository();
     bool _loading = false;
     bool _signUpLoading = false;

     void setLoading (bool element){
       _loading=element;
       notifyListeners();
     }
  void setSignUpLoading (bool element){
     _signUpLoading=element;
    notifyListeners();
  }
     bool get loading =>_loading;
     bool get signUpLoading =>_signUpLoading;
   Future<void> loginApi(dynamic data,BuildContext context) async{
       // setLoading(true);
       _myRepo.loginApi(data).then((value) {
         setLoading(false);
         Utils.toastMessage("Sucessfull");
         UserViewModel().saveUser(UserModel.fromJson(value));
         Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (_) => false);
      if(kDebugMode) {

        print(value.toString());
      }
    }).onError((error, stackTrace){
         setLoading(false);
      if(kDebugMode) {
        Utils.toastMessage(error.toString());
        print(error.toString());

      }
    });

  }
  Future<void> signupApi(dynamic data,BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.SignUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.toastMessage("SignUp Sucessfull");
      Navigator.pushNamedAndRemoveUntil( context, RoutesName.login, (route) => false);
      if(kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      if(kDebugMode) {
        Utils.toastMessage(error.toString());
        print(error.toString());
      }
    });
  }

}