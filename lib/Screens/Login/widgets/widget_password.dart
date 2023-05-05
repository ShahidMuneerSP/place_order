// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:red_hot_twister_app/Theme/apptheme.dart';
// import '../../../common/custom_textformfield.dart';

// Widget widgetPassword(controller) {
//   return CustomTextFormField(
//     controller: controller,
//     hintText: "Password",
//     validatorText: "Enter password",
//     prefixIcon: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//       child: SvgPicture.asset(
//         'assets/password.svg',
//         color: AppTheme.primaryColor,
//         width: 25.w,
//       ),
//     ),
//     validator: (value) {
//       if (value == null || value.trim().isEmpty) {
//         return 'Please enter password';
//       }
//     },
//     obsecureText: true,
//   );
// }
