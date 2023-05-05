import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:red_hot_twister_app/Controller/takeAwayController.dart';
import 'package:red_hot_twister_app/Dummy/takeAwayData.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Theme/apptheme.dart';
import '../FoodItemTakeAway/foodItemTakeAwayScreen.dart';
import '../widgets/appbarwidget.dart';

TakeAwayController takeAwayController = TakeAwayController();

class TakeAwayScreen extends StatefulWidget {
  const TakeAwayScreen({super.key});

  @override
  State<TakeAwayScreen> createState() => _TakeAwayScreenState();
}

class _TakeAwayScreenState extends State<TakeAwayScreen> {
  final PageController controller = PageController();
  Timer? timer;
  int activeIndex = 0;
  final urlImages = [
    "https://i.pinimg.com/originals/ed/d0/bb/edd0bb52e6443aaee46f4e0114482481.jpg",
    "https://img.freepik.com/free-vector/delicious-fast-food-menu_24877-51616.jpg?w=740&t=st=1681143203~exp=1681143803~hmac=73bbcde597d9ceff8998c818eb7f0395ebe84723391990b3d08172daf7795475",
    "https://i.pinimg.com/564x/7f/3a/32/7f3a32865e1211387d21420583fa8fc9.jpg",
    "https://en.pimg.jp/072/087/616/1/72087616.jpg"
  ];
  @override
  void initState() {
    takeAwayController.takeAwayList.addAll(listItems);
    takeAwayController.isLoading(false);
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    stopTimer();
    controller.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (activeIndex < (urlImages.length)) {
        activeIndex++;
      } else {
        activeIndex = 0;
      }
      controller.animateToPage(
        activeIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //appbar
            const AppBarWidget(
              title: 'TAKE AWAY',
            ),
            Container(
              margin: EdgeInsets.all(12.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //carousel slider
                  carouselSliderwidget(size),
                  SizedBox(
                    height: 12.h,
                  ),
                  //indicator
                  Center(child: buildIndicator(size)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "MENU",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() => takeAwayController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          ),
                        )
                      : takeAwayController.takeAwayList.isEmpty
                          ? Center(
                              child: Text(
                                "No data..",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          :
                          //categories
                          menuItemGridView(size)),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  SizedBox carouselSliderwidget(Size size) {
    return SizedBox(
      height: size.height / 4.h,
      width: double.infinity,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (index) => setState(() => activeIndex = index),
        itemCount: urlImages.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: SizedBox(
              height: size.height / 4.h,
              width: double.infinity,
              child: Image.network(
                urlImages[index],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildIndicator(Size size) => AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
          dotWidth: size.width * 0.01.w,
          activeDotColor: Colors.black,
          dotHeight: size.height * 0.01.h),
      activeIndex: activeIndex,
      count: urlImages.length);
  Widget buildImage(String urlImage, int index) => ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
      );
  GridView menuItemGridView(Size size) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemCount: takeAwayController.takeAwayList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = takeAwayController.takeAwayList[index];
        return GestureDetector(
          onTap: () {
            Get.to(FoodItemTakeAwayScreen(
                takeAwayData: takeAwayController.takeAwayList,
                index: index,
                items: item.subList,
                title: item.title));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20.r,
                  spreadRadius: -2.r,
                ),
              ],
            ),
            child: Column(
              children: [
                //category image
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      item.imageUrl,
                      height: size.height / 7.h,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                //category title
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
