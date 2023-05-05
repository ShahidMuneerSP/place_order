import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Theme/apptheme.dart';

Widget buttonItem(
    {required BuildContext context,
    required String name,
    required String iconPath,
    var onTap}) {
  final Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppTheme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 20.r,
            spreadRadius: 2.r,
          ),
        ],
      ),
      height: size.height / 6.h,
      width: size.width / 3.w,
      padding: EdgeInsets.all(20.r),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon
            SvgPicture.asset(
              iconPath,
              color: Colors.white,
              height: size.height * 0.06.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
