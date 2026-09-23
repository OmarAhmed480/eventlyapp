import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  MainErrorWidget({super.key,required this.errorMessage,required this.style});
String errorMessage;
TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style:style,
      ),
    );
  }
}
