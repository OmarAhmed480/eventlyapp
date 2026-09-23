import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class MainLoadingWidget extends StatelessWidget {
  MainLoadingWidget({super.key,this.backgroundColor});
  Color ?backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor:backgroundColor?? AppColor.blueColor,

      ),
    );
  }
}
