import 'package:ebizz_practical_task/app/models/photo_list_resp_model.dart';
import 'package:ebizz_practical_task/app/services/network_services.dart';
import 'package:ebizz_practical_task/app/utils/app_navigation.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenViewModel extends ChangeNotifier {

  Future<List<PhotoListRespModel>>? futureCall;

  void init() {
    futureCall = getPhotoList();
  }

  Future<List<PhotoListRespModel>> getPhotoList() async {
    try {
      var result = await NetworkServices.getPhotoList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  void onRefresh() {
    futureCall = getPhotoList();
  }

  void onPhotoClick(BuildContext context,{required List<PhotoListRespModel> list,required int index}) {
    AppNavigation.instance.visitPhotoCarouselView(list: list, index: index);
  }


}
