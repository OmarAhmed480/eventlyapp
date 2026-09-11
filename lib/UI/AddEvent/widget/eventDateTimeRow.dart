import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDateTimeRow extends StatelessWidget {
  final VoidCallback onTap;
  final String eventDatetime;
  final String chooseDatetime;
  final String assetsDatetime;
  final Color colorDatetime;
  final TextStyle styleDatetime;
  final TextStyle styleChooseDatetime;

  const EventDateTimeRow({
    super.key,
    required this.onTap,
    required this.eventDatetime,
    required this.chooseDatetime,
    required this.assetsDatetime,
    required this.colorDatetime,
    required this.styleDatetime,
    required this.styleChooseDatetime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(assetsDatetime, color: colorDatetime),
            SizedBox(width: 12.w),
            Text(eventDatetime, style: styleDatetime),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Text(chooseDatetime, style: styleChooseDatetime),
        ),
      ],
    );
  }
}
