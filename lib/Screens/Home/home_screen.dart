import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:red_hot_twister_app/Screens/Home/widgets/button_model.dart';
import 'package:red_hot_twister_app/Theme/apptheme.dart';

import '../EatIn/eat_in_screen.dart';
import '../TakeAway/take_away_screen.dart';

//home
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // background image
          Image.network(
            'https://img.freepik.com/free-photo/meat-burger-served-with-french-fries-sauces_140725-6710.jpg?w=740&t=st=1681204538~exp=1681205138~hmac=775c53e6bda2188363648b1d430b745610b34cc6e178267d4e8aa68ce7791565',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          FutureBuilder<Widget>(
            future: fetchWidget(context, size),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  ),
                );
              } else {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: snapshot.data ?? Container(),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<Widget> fetchWidget(BuildContext context, Size size) async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate network delay
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(15.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  "PLACE ORDER",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.7.h,
              ),
              Row(
                children: [
                  const Spacer(),
                  //Eat In button
                  // ignore: use_build_context_synchronously
                  buttonItem(
                      iconPath: "assets/drinking-icon 1.svg",
                      name: "EAT IN",
                      onTap: () {
                        Get.to(() => const EatInScreen());
                      },
                      context: context),
                  SizedBox(
                    width: 35.w,
                  ),
                  //Take Away button
                  // ignore: use_build_context_synchronously
                  buttonItem(
                    iconPath: "assets/take-away-svgrepo-com (1) 1.svg",
                    name: "TAKE AWAY",
                    onTap: () {
                      Get.to(() => const TakeAwayScreen());
                    },
                    context: context,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 50.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
