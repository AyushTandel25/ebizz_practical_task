import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebizz_practical_task/app/models/photo_list_resp_model.dart';
import 'package:ebizz_practical_task/app/utils/size_utils.dart';
import 'package:ebizz_practical_task/main.dart';
import 'package:ebizz_practical_task/screens/photo_carousel_view/photo_carousel_view_model.dart';
import 'package:flutter/material.dart';

import '../../app/utils/cache_network_image.dart';

class PhotoCarouselScreen extends StatefulWidget {
  final List<PhotoListRespModel> photoList;
  final int currentIndex;

  const PhotoCarouselScreen(
      {Key? key, required this.photoList, required this.currentIndex})
      : super(key: key);

  @override
  State<PhotoCarouselScreen> createState() => _PhotoCarouselScreenState();
}

class _PhotoCarouselScreenState extends State<PhotoCarouselScreen> {
  PhotoCarouselViewModel viewModel = PhotoCarouselViewModel();

  @override
  void initState() {
    viewModel.init(list: widget.photoList, index: widget.currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel.photoList,
        builder: (context, valueList, _) {
          return valueList.isNotEmpty
              ? ValueListenableBuilder(
                  valueListenable: viewModel.currentIndex,
                  builder: (context, index, _) {
                    return Scaffold(
                      appBar: getAppBar(
                        valueList[index].title ?? "",
                      ),
                      body: body(valueList, index),
                    );
                  })
              : Container();
        });
  }

  PreferredSizeWidget getAppBar(String title) {
    return AppBar(
      backgroundColor: appTheme!.colorPrimary,
      title: Text(
        title,
        style: appTheme!.textSemiBold14White,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: appTheme!.whiteColor,
        ),
      ),
    );
  }

  Widget body(List<PhotoListRespModel> list, int currentIndex) {
    return Center(
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: viewModel.controller,
            items: getImageListView(list),
            options: CarouselOptions(
              height: MathUtilities.screenHeight(context) * 0.5,
              viewportFraction: 1,
              initialPage: currentIndex,
              enableInfiniteScroll: false,
              reverse: false,
              onPageChanged: (index, r) {
                viewModel.updateCurrentIndex(index);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Positioned(
            left: getSize(10),
            bottom: 0,
            top: 0,
            child: currentIndex > 0 ? InkWell(
              onTap: () {
                viewModel.onBackWardClick(currentIndex-1);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appTheme!.whiteColor
                ),
                padding: EdgeInsets.all(getSize(10)),
                alignment: Alignment.center,
                child: Icon(Icons.arrow_back,size: getSize(20),),
              ),
            ) : Container(),
          ),
          Positioned(
            right: getSize(10),
            bottom: 0,
            top: 0,
            child: currentIndex < list.length ? InkWell(
              onTap: () {
                viewModel.onForwardClick(currentIndex+1);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appTheme!.whiteColor
                ),
                padding: EdgeInsets.all(getSize(10)),
                alignment: Alignment.center,
                child: Icon(Icons.arrow_forward,size: getSize(20),),
              ),
            ) : Container(),
          )
        ],
      ),
    );
  }

  List<Widget> getImageListView(List<PhotoListRespModel> list) {
    return list.map((e) {
      var url = e.url ?? "";

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(5)),
        child: CachedImageWidget(
          url: url,
          height: MathUtilities.screenHeight(context) * 0.5,
        ),
      );
    }).toList();
  }
}
