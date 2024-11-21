
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusttomText extends StatelessWidget {
  CusttomText({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
