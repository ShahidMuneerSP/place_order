// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../Theme/apptheme.dart';
// import '../../Home/home_screen.dart';

// Widget widgetButton(
//   GlobalKey<FormState> formKey,
//   TextEditingController username,
//   TextEditingController password,
// ) {
//   return GestureDetector(
//     onTap: () async {
//      Get.off(const HomeScreen());
//     },
//     child: Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         vertical: 19.h,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         color: AppTheme.primaryColor,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 30.r,
//             color: AppTheme.primaryColor,
//             spreadRadius: -10,
//             offset: Offset(0, 10.h),
//           )
//         ],
//       ),
//       child: Center(
//         child: Text(
//           'SignIn',
//           style: TextStyle(
//             fontSize: 13.sp,
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     ),
//   );
// }
