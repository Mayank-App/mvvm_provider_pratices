import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:clean_formate/data/network/baseApiServices.dart';
import 'package:clean_formate/data/response/api_exceptions.dart';
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices{
  @override

  Future getGetApiResponse(String url) async {
     dynamic responseJson;
     try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
     }on SocketException{
       throw FetchDataException("No internet connection");
     }
      return responseJson;

  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
    Response response = await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch (response.statusCode){
      case 200:
          dynamic responseJson = jsonDecode(response.body.toString());
          return responseJson;

      case 400:
                throw BadRequestException(response.body.toString());

      case 404:
                throw UnauthorisedException(response.body.toString());

        default:
              throw FetchDataException("Error occured while communicating with server "+"with status code"+response.body.toString());
    }

  }
}