import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.child,
    this.radiusCircular,
    this.sideColor,
    this.width,
    this.height
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? radiusCircular;
  final Color? sideColor;
  final double? width;
  final double?height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height??55 ,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.green,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: sideColor ?? Colors.transparent,
              width: width ?? 1,
            ),
            borderRadius: BorderRadius.circular(radiusCircular ?? 16),
          ),
        ),
        child: child,
      ),
    );
  }
}
