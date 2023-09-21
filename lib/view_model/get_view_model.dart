 import 'package:clean_formate/respository/auth_respository.dart';
import 'package:flutter/widgets.dart';

import '../models/get_detail_model.dart';

class GetViewModel extends ChangeNotifier {
  //List<GetUserDetailModel> user = [];
  final repo = AuthRespository();

  Future<GetUserDetailModel> userDetail() async {
    final response = await repo.getUserDetailApi();
    //   debugPrint(response['page'].toString());
    //    for (Map<String, dynamic> index in response['data']) {
    //      user.add(GetUserDetailModel.fromJson(index));
    //    }
    return GetUserDetailModel.fromJson(response);
  }

}