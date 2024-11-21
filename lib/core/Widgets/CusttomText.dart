import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusttomText extends StatelessWidget {
  final double fontsize;
  final FontWeight fontWeight;
  String text;
  CusttomText({
    required this.text,
    this.fontsize = 20,
    this.fontWeight = FontWeight.w400,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: fontsize.sp, fontWeight: fontWeight),
    );
  }
}
