import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/apptheme.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ButtonWidget({super.key,required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 10.sp),
        ));
  }
}
