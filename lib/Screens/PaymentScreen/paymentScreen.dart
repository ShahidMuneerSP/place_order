import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/cartorCashWidget.dart';

class PaymentScreen extends StatelessWidget {
  final double price;
  const PaymentScreen({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.08.h,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(12.r),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "SELECT PAYMENT METHOD",
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'AED ${price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          CardOrCashWidget(
                              name: "CARD",
                              iconPath: "assets/icons8-credit-card-66.png",
                              onTap: () {}),
                          SizedBox(
                            width: 10.w,
                          ),
                          CardOrCashWidget(
                              name: "CASH",
                              iconPath: "assets/money.png",
                              onTap: () {}),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
