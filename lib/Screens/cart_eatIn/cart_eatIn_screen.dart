import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:red_hot_twister_app/Controller/foodItemEatIn.dart';
import 'package:red_hot_twister_app/Screens/PaymentScreen/paymentScreen.dart';
import 'package:red_hot_twister_app/Screens/cart_eatIn/ViewModels/calculatePrice.dart';
import 'package:red_hot_twister_app/Screens/cart_eatIn/widgets/cartCustomiseScreen.dart';
import 'package:red_hot_twister_app/Theme/apptheme.dart';

class CartEatInScreen extends StatefulWidget {
  final FoodItemEatInController foodItemEatInController;

  const CartEatInScreen({
    Key? key,
    required this.foodItemEatInController,
  }) : super(key: key);

  @override
  State<CartEatInScreen> createState() => _CartEatInScreenState();
}

class _CartEatInScreenState extends State<CartEatInScreen> {
  double totalPrice = 0.00;

  @override
  void initState() {
    updateTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.foodItemEatInController.cartItems.isEmpty
          ? SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //appbar
                  appBarWidget(size),
                  Expanded(
                    child: Center(
                      child: Text(
                        'No items in cart',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  appBarWidget(size),
                  Expanded(
                    child: Container(
                      child: Obx(() => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 10.h),
                                child: Text(
                                  "Orders",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: cartItemsListViewWidget(size),
                              ),
                              SizedBox(
                                height: size.height / 8.h,
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
      bottomSheet: widget.foodItemEatInController.cartItems.isEmpty
          ? Container(
              height: size.height / 8.h,
            )
          : cartBottomSheetContainer(size),
    );
  }

  Container cartBottomSheetContainer(Size size) {
    return Container(
      color: const Color.fromARGB(255, 230, 229, 229),
      height: size.height / 8.h,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              children: [
                const Spacer(),
                Text("Total: ",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  "AED ${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(PaymentScreen(price: totalPrice));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.w,
              ),
              width: size.width / 1.3,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Center(
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  ListView cartItemsListViewWidget(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.foodItemEatInController.cartItems.length,
      itemBuilder: (context, index) {
        final item = widget.foodItemEatInController.cartItems[index];
        log("type${item.type}");

        log(item.title.toString());
        log('cartEatIn:${widget.foodItemEatInController.cartItemCount.value}');
        return widget.foodItemEatInController.cartItemCount.value == 0
            ? Container()
            : Container(
                padding: EdgeInsets.only(left: 0.w, right: 5.w),
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
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
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '${item.title}',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (widget.foodItemEatInController
                                            .cartItems[index].quantity >
                                        1) {
                                      widget.foodItemEatInController
                                          .cartItems[index].quantity--;
                                      updateTotalPrice();
                                    }
                                  });
                                },
                                icon: CircleAvatar(
                                  maxRadius: 12.r,
                                  backgroundColor: Colors.grey[600],
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.remove,
                                    size: 16.r,
                                  ),
                                ),
                              ),
                              Text(
                                widget.foodItemEatInController.cartItems[index]
                                    .quantity
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.foodItemEatInController
                                        .cartItems[index].quantity++;
                                    updateTotalPrice();
                                  });
                                },
                                icon: CircleAvatar(
                                  maxRadius: 12.r,
                                  backgroundColor: Colors.grey[600],
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    size: 16.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                              'AED ${(calculateItemPrice(item))?.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(
                            width: 10.w,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.r),
                            child: Container(
                              height: size.height * 0.12.h,
                              width: size.width * 0.25.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(item.image ?? ""))),
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Container(
                                width: size.width / 4.w,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                color: Colors.grey,
                                                width: 0.5)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext ctx) {
                                            return AlertDialog(
                                              content: const Text(
                                                  'Do you want to delete?'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () async {
                                                      widget
                                                          .foodItemEatInController
                                                          .removeFromCart(
                                                              index);
                                                      updateTotalPrice();
                                                      Get.back();
                                                    },
                                                    child: const Text(
                                                      'Yes',
                                                      style: TextStyle(
                                                          color: AppTheme
                                                              .primaryColor),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      // Close the dialog
                                                      Get.back();
                                                    },
                                                    child: const Text(
                                                      'No',
                                                      style: TextStyle(
                                                          color: AppTheme
                                                              .primaryColor),
                                                    ))
                                              ],
                                            );
                                          });
                                    },
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(
                                          color: AppTheme.primaryColor,
                                          fontSize: 10.sp),
                                    )),
                              ),
                              item.type == 2
                                  ? Container()
                                  : Container(
                                      width: size.width / 4.w,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              side: MaterialStateProperty.all(
                                                  const BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.5)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CartCustomiseScreen(
                                                  initialText:
                                                      calculateItemPrice(item),
                                                  index: index,
                                                  listItems: widget
                                                      .foodItemEatInController
                                                      .data,
                                                  customiseItems:
                                                      item.customiseModel,
                                                );
                                              },
                                            );
                                            setState(() {
                                              updateTotalPrice();
                                            });
                                          },
                                          child: Text(
                                            "Customise",
                                            style: TextStyle(
                                                color: Colors.grey[900],
                                                fontSize: 10.sp),
                                          )),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ));
      },
    );
  }

  Row appBarWidget(Size size) {
    return Row(
      children: [
        Container(
          height: size.height * 0.08.h,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              Text(
                "Food Cart",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void updateTotalPrice() {
    double newTotalPrice = 0.0;

    for (var item in widget.foodItemEatInController.cartItems) {
      log(item.price.toString());
      newTotalPrice += item.price * item.quantity;
      for (var element in item.customiseModel) {
        newTotalPrice += (element.customisePrice * element.customiseCount);
      }
    }

    setState(() {
      log(newTotalPrice.toString());
      totalPrice = newTotalPrice;
    });
  }
}
