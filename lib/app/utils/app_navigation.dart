

import 'package:ebizz_practical_task/app/utils/navigation_utils.dart';
import 'package:ebizz_practical_task/screens/photo_carousel_view/photo_carousel_screen.dart';

import '../models/photo_list_resp_model.dart';

class AppNavigation {
  static AppNavigation instance = AppNavigation();

  void visitPhotoCarouselView({required List<PhotoListRespModel> list,required int index}) {
    NavigationUtilities.push(PhotoCarouselScreen(photoList: list, currentIndex: index));
  }

}
