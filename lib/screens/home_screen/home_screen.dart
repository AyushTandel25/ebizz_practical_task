import 'package:ebizz_practical_task/app/models/photo_list_resp_model.dart';
import 'package:ebizz_practical_task/app/utils/cache_network_image.dart';
import 'package:ebizz_practical_task/app/utils/size_utils.dart';
import 'package:ebizz_practical_task/app/utils/utils.dart';
import 'package:ebizz_practical_task/main.dart';
import 'package:ebizz_practical_task/screens/home_screen/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  void initState() {
    viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photo Gallery",
          style: appTheme!.textSemiBold14White,
        ),
        backgroundColor: appTheme!.colorPrimary,
      ),
      body: body(),
    );
  }

  Widget body() {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          viewModel.onRefresh();
        });
      },
      child: FutureBuilder<List<PhotoListRespModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong",
                style: appTheme!.textSemiBold14Hint,
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: appTheme!.colorPrimary,
              ),
            );
          } else {
            return getImageGalleryView(snapshot.data ?? []);
          }
        },
        future: viewModel.futureCall!,
      ),
    );
  }

  Widget getImageGalleryView(List<PhotoListRespModel> list) {

    return list.isNotEmpty
        ? GridView.builder(
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: getSize(5),
                crossAxisSpacing: getSize(5),
                childAspectRatio: 1),
            itemBuilder: (context, index) {
              var url = list[index].url ?? "";

              return InkWell(
                onTap: () {
                  viewModel.onPhotoClick(context, list: list, index: index);
                },
                child: CachedImageWidget(
                  url: url,
                  height: getSize(150),
                ),
              );
            },
          )
        : Utils.getNoDataAvailableWidget(
            errorMessage: "No Image Available",
            isRefresh: true,
            onRefresh: () async {
              setState(() {
                viewModel.onRefresh();
              });
            },
          );
  }
}
