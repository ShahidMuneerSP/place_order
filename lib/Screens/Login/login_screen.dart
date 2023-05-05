// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:red_hot_twister_app/Screens/Login/widgets/widgetHead.dart';
// import 'package:red_hot_twister_app/Screens/Login/widgets/widget_button.dart';
// import 'package:red_hot_twister_app/Screens/Login/widgets/widget_password.dart';
// import 'package:red_hot_twister_app/Screens/Login/widgets/widget_username.dart';

// ///login screen
// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     ///controllers
//     TextEditingController usenameController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();

//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               margin:
//                   EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   //title
//                   const WidgetHead(),
//                   SizedBox(
//                     height: 120.h,
//                   ),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         //username textfield
//                         widgetUsername(usenameController),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         //password textfield
//                         widgetPassword(passwordController),
//                         SizedBox(
//                           height: 40.h,
//                         ),
//                         //login button
//                         widgetButton(_formKey, usenameController,
//                             passwordController),
//                         SizedBox(
//                           height: 40.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
