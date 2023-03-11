import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ebizz_practical_task/app/constants/api_constants.dart';
import 'package:ebizz_practical_task/app/constants/app_constants.dart';
import 'package:ebizz_practical_task/app/models/photo_list_resp_model.dart';

class NetworkServices {
  static Future<List<PhotoListRespModel>> getPhotoList() async {
    try {
      List<PhotoListRespModel> respList = [];
      var dio = Dio();
      dio.options.baseUrl = AppConstants.baseUrl;
      var result = await dio.get(
        ApiConstants.getPhotoPath,
      );
      if (result.statusCode == 200) {
        if(result.data is List) {
          var list = result.data as List;
          list.forEach((element) {
            var data = PhotoListRespModel.fromJson(element);
            respList.add(data);
          });
        }
      }
      return respList;
    } catch (e,s) {
      print(e);
      print(s);
      rethrow;
    }
  }
}
