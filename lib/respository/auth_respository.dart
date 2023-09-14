import 'package:clean_formate/data/network/baseApiServices.dart';
import 'package:clean_formate/data/network/networkApiServices.dart';
import 'package:clean_formate/res/app_url.dart';

class AuthRespository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic > loginApi(dynamic data) async{
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.loginEndPoint, data);
      return response ;
    }
    catch(e){
      throw e;
    }
  }
  Future<dynamic> SignUpApi(dynamic data) async{
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerEndPont, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
  
  Future<dynamic> getUserDetailApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.getUserDeatils);
      return response ;
    }
    catch(e){
      throw e;
    }
  }
}