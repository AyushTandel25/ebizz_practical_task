import 'package:carousel_slider/carousel_controller.dart';
import 'package:ebizz_practical_task/app/models/photo_list_resp_model.dart';
import 'package:flutter/cupertino.dart';

class PhotoCarouselViewModel extends ChangeNotifier{

  ValueNotifier<List<PhotoListRespModel>> photoList = ValueNotifier([]);
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  CarouselController controller = CarouselController();

  void init({required List<PhotoListRespModel> list,required int index}) {
    updateCurrentIndex(index);
    updatePhotoList(list);
  }

  void updatePhotoList(List<PhotoListRespModel> list) {
    if(list.isEmpty) return;
    photoList.value.clear();
    photoList.value.addAll(list);
    photoList.notifyListeners();
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
    currentIndex.notifyListeners();
  }

  void onForwardClick(int index) {
    controller.animateToPage(index,curve: Curves.fastLinearToSlowEaseIn,duration: Duration(milliseconds: 500));
  }

  void onBackWardClick(int index) {
    controller.animateToPage(index,curve: Curves.fastLinearToSlowEaseIn,duration: Duration(milliseconds: 500));
  }

}