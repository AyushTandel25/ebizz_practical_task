import 'package:ebizz_practical_task/app/utils/size_utils.dart';
import 'package:ebizz_practical_task/main.dart';
import 'package:flutter/material.dart';

class Utils {
  static Widget getNoDataAvailableWidget({
    String? errorMessage,
    bool? isRefresh,
    Future Function()? onRefresh,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errorMessage ?? "No Data Available",
            style: appTheme!.textSemiBold14Hint,
          ),
          SizedBox(
            height: getSize(20),
          ),
          if(isRefresh ?? false)
          ElevatedButton(
            onPressed: () async {
              if(onRefresh!=null) {
                await onRefresh();
              }
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getSize(10)))),
              side: MaterialStateProperty.all(BorderSide(color: appTheme!.hintColor))
            ),
            child: Text(
              "Refresh",
              style: appTheme!.textSemiBold16Black,
            ),
          ),
        ],
      ),
    );
  }
}
