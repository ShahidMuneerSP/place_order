import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CardOrCashWidget extends StatelessWidget {
  var onTap;
  final String name;
  final String iconPath;

  CardOrCashWidget({
    this.onTap,
    Key? key,
    required this.name,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20.r,
              spreadRadius: -15.r,
            ),
          ],
        ),
        height: 190.h,
        width: 140.w,
        padding: EdgeInsets.all(20.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                height: 30,
                width: 30,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
