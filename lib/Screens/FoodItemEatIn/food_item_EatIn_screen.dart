import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:red_hot_twister_app/Dummy/eatInData.dart';
import 'package:red_hot_twister_app/Model/ListItem.dart';
import 'package:red_hot_twister_app/Model/cartItem.dart';
import 'package:red_hot_twister_app/Screens/FoodItemEatIn/widgets/PopupCustomiseEatIn.dart';
import 'package:red_hot_twister_app/Screens/widgets/buttonWidget.dart';
import 'package:red_hot_twister_app/Theme/apptheme.dart';
import '../../Controller/foodItemEatIn.dart';
import '../cart_eatIn/cart_eatIn_screen.dart';

class FoodItemEatInScreen extends StatefulWidget {
  final String title;
  final List eatInData;
  final int index;
  final List<Map<String, dynamic>> items;
  const FoodItemEatInScreen({
    super.key,
    required this.eatInData,
    required this.index,
    required this.items,
    required this.title,
  });

  @override
  State<FoodItemEatInScreen> createState() => _FoodItemEatInScreenState();
}

class _FoodItemEatInScreenState extends State<FoodItemEatInScreen> {
  FoodItemEatInController foodItemEatinController = FoodItemEatInController();

  void _updateText(double? newText) {
    foodItemEatinController.totalPrice.value = newText ?? 0.00;
  }

  @override
  void initState() {
    super.initState();
    foodItemEatinController.title.value = widget.title;
    foodItemEatinController.data.clear();
    for (var item in widget.items) {
      foodItemEatinController.data.add(CartItem(
          iType: item['type'],
          id: item['id'],
          type: item['type'],
          customiseModel: [
            CustomiseModel(
                customiseTitle: "Shrimps",
                customiseImage:
                    "https://img.freepik.com/free-photo/gambas-al-ajillo-prawn-based-dish-close-up-photography_53876-104575.jpg?w=740&t=st=1681027730~exp=1681028330~hmac=68f7ffd509819e6938a1bfcdd249fc26050ced416c4f3796f5424fb596c7026c",
                customisePrice: 12.00,
                customiseCount: 0),
            CustomiseModel(
                customiseTitle: "3 Pc Jalapeno Cheesy Bites",
                customiseImage:
                    "https://img.freepik.com/free-photo/baked-clam-with-garlic-butter-served-with-garlic-bread-dark-background_1150-45280.jpg?w=1060&t=st=1681028312~exp=1681028912~hmac=6f2bca488dd465ade445e9e21cea56f3316bbab64fdde0ad521100ddb2210fac",
                customisePrice: 9.00,
                customiseCount: 0),
            CustomiseModel(
                customiseTitle: "3 Pcs Hot Lime Wings",
                customiseImage:
                    "https://img.freepik.com/free-vector/chicken-fast-food-realistic-composition-with-black-background-flames-fire-pepper-leaves-chicken-wings-vector-illustration_1284-78833.jpg?w=1380&t=st=1682324537~exp=1682325137~hmac=91950bf8632c34ccd3a4ae539b317bc9f3d2d7f774286e39ca0a26ecc017ec94",
                customisePrice: 9.00,
                customiseCount: 0),
            CustomiseModel(
                customiseTitle: "Rice",
                customiseImage:
                    "https://img.freepik.com/free-vector/hand-drawn-gopalkala-illustration_23-2148993446.jpg?w=740&t=st=1682324635~exp=1682325235~hmac=1f02d7754b2b60b5319ec715328e16394da7ce356da59f944af06e9b3f0e1318",
                customisePrice: 7.00,
                customiseCount: 0),
            CustomiseModel(
                customiseTitle: "Cookie",
                customiseImage:
                    "https://img.freepik.com/free-vector/hand-drawn-chocolate-chip-cookies-vector_53876-161455.jpg?w=740&t=st=1682324701~exp=1682325301~hmac=34628b7c09d287f0ff021f10decb200128aeead42df554e23ce849f233fac501",
                customisePrice: 6.00,
                customiseCount: 0),
            CustomiseModel(
                customiseTitle: "2 Pcs Bun",
                customiseImage:
                    "https://img.freepik.com/free-vector/bread-white-background_1308-103966.jpg?w=1060&t=st=1682324886~exp=1682325486~hmac=78db0fa24ebfcc658893e854af68d6ed720f01e0291c553ed964adcd29396d48",
                customisePrice: 1.00,
                customiseCount: 0)
          ],
          image: item['image'],
          price: double.parse(item['price']),
          quantity: 0,
          title: item['foodName']));
    }
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
              appbarWidget(size),
              Container(
                margin: EdgeInsets.all(12.r),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //category horizotal listview
                      categoryListViewWidget(size),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      //sublist gridview
                      Obx(
                        () => GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: foodItemEatinController.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = foodItemEatinController.data[index];
                            return Container(
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
                                  //sublist item image
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, left: 10.w, right: 10.w),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.r),
                                      child: Image.network(
                                        item.image ?? "",
                                        height: size.height / 12.h,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  //sublist item title
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 4.h, left: 10.w, right: 10.w),
                                    child: Text(
                                      item.title ?? "",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  //sublist item price
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 3.h, left: 10.w, right: 10.w),
                                    child: Text(
                                      "AED ${item.price}",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  item.type == 0
                                      ? incrementDecrementquantityWidget(item)
                                      : item.type == 1
                                          ?
                                          //Customise button
                                          customiseButtonWidget(
                                              index, context, item)
                                          :
                                          //Add button
                                          addButtonWidget(index, item)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height / 12.h,
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: bottomSheetContainerWidget(size, context),
    );
  }

  Container bottomSheetContainerWidget(Size size, BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 230, 229, 229),
      height: size.height / 13.h,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Obx(
                () => Text(
                  'AED ${(foodItemEatinController.totalPrice.value)?.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              //add to cart button
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: ButtonWidget(
                  title: "Add to Cart",
                  onPressed: () {
                    log("foodItemCart:${foodItemEatinController.cartItemCount.value}");
                    foodItemEatinController.totalPrice.value == 0.00
                        ? nullFunction()
                        : showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                content:
                                    const Text('Do you want to add to cart?'),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        for (var element
                                            in foodItemEatinController.data) {
                                          if (element.quantity != 0) {
                                            log("Price:${element.price}"
                                                .toString());

                                            foodItemEatinController.addToCart(
                                                type: element.iType,
                                                title: element.title,
                                                price: element.price,
                                                image: element.image,
                                                quantity: element.quantity,
                                                customiseModel:
                                                    element.customiseModel);
                                          }
                                        }
                                        Get.back();
                                        foodItemEatinController.data.clear();
                                        foodItemEatinController
                                            .totalPrice.value = 0.00;
                                        for (var item in widget.items) {
                                          foodItemEatinController.data.add(
                                              CartItem(
                                                  iType: item['type'],
                                                  id: item['id'],
                                                  type: item['type'],
                                                  customiseModel: [
                                                    CustomiseModel(
                                                        customiseTitle:
                                                            "Shrimps",
                                                        customiseImage:
                                                            "https://img.freepik.com/free-photo/gambas-al-ajillo-prawn-based-dish-close-up-photography_53876-104575.jpg?w=740&t=st=1681027730~exp=1681028330~hmac=68f7ffd509819e6938a1bfcdd249fc26050ced416c4f3796f5424fb596c7026c",
                                                        customisePrice: 12.00,
                                                        customiseCount: 0),
                                                    CustomiseModel(
                                                        customiseTitle:
                                                            "3 Pc Jalapeno Cheesy Bites",
                                                        customiseImage:
                                                            "https://img.freepik.com/free-photo/baked-clam-with-garlic-butter-served-with-garlic-bread-dark-background_1150-45280.jpg?w=1060&t=st=1681028312~exp=1681028912~hmac=6f2bca488dd465ade445e9e21cea56f3316bbab64fdde0ad521100ddb2210fac",
                                                        customisePrice: 9.00,
                                                        customiseCount: 0),
                                                    CustomiseModel(
                                                        customiseTitle:
                                                            "3 Pcs Hot Lime Wings",
                                                        customiseImage:
                                                            "https://img.freepik.com/free-vector/chicken-fast-food-realistic-composition-with-black-background-flames-fire-pepper-leaves-chicken-wings-vector-illustration_1284-78833.jpg?w=1380&t=st=1682324537~exp=1682325137~hmac=91950bf8632c34ccd3a4ae539b317bc9f3d2d7f774286e39ca0a26ecc017ec94",
                                                        customisePrice: 9.00,
                                                        customiseCount: 0),
                                                    CustomiseModel(
                                                        customiseTitle: "Rice",
                                                        customiseImage:
                                                            "https://img.freepik.com/free-vector/hand-drawn-gopalkala-illustration_23-2148993446.jpg?w=740&t=st=1682324635~exp=1682325235~hmac=1f02d7754b2b60b5319ec715328e16394da7ce356da59f944af06e9b3f0e1318",
                                                        customisePrice: 7.00,
                                                        customiseCount: 0),
                                                    CustomiseModel(
                                                        customiseTitle:
                                                            "Cookie",
                                                        customiseImage:
                                                            "https://img.freepik.com/free-vector/hand-drawn-chocolate-chip-cookies-vector_53876-161455.jpg?w=740&t=st=1682324701~exp=1682325301~hmac=34628b7c09d287f0ff021f10decb200128aeead42df554e23ce849f233fac501",
                                                        customisePrice: 6.00,
                                                        customiseCount: 0),
                                                    CustomiseModel(
                                                        customiseTitle:
                                                            "2 Pcs Bun",
                                                        customiseImage:
                                                            "https://img.freepik.com/free-vector/bread-white-background_1308-103966.jpg?w=1060&t=st=1682324886~exp=1682325486~hmac=78db0fa24ebfcc658893e854af68d6ed720f01e0291c553ed964adcd29396d48",
                                                        customisePrice: 1.00,
                                                        customiseCount: 0)
                                                  ],
                                                  image: item['image'],
                                                  price: double.parse(
                                                      item['price']),
                                                  quantity: 0,
                                                  title: item['foodName']));
                                        }
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                            color: AppTheme.primaryColor),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            color: AppTheme.primaryColor),
                                      ))
                                ],
                              );
                            });
                  },
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton addButtonWidget(int index, item) {
    return ElevatedButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: AppTheme.primaryColor, width: 0.5),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          CartItem? currentItem;
          for (var item in foodItemEatinController.selectedItems) {
            if (item.id == foodItemEatinController.data[index].id) {
              currentItem = foodItemEatinController.data[index];
            }
          }
          if (currentItem != null) {
            setState(() {
              item.type = 0;
              item.quantity = 1;
            });

            for (var item in foodItemEatinController.data) {
              foodItemEatinController.totalPrice.value =
                  foodItemEatinController.totalPrice.value +
                      (item.price * item.quantity);
              for (var element in item.customiseModel) {
                foodItemEatinController.totalPrice.value =
                    foodItemEatinController.totalPrice.value +
                        (element.customisePrice * element.customiseCount);
              }
            }
            _updateText(foodItemEatinController.totalPrice.value +
                foodItemEatinController.selectedItems[index].price);
          } else {
            setState(() {
              item.type = 0;
              item.quantity = 1;
            });

            for (var element in foodItemEatinController.data) {
              foodItemEatinController.totalPrice.value =
                  foodItemEatinController.totalPrice.value;
            }
            _updateText(foodItemEatinController.totalPrice.value +
                foodItemEatinController.data[index].price);
          }
        },
        child: Text(
          "Add",
          style: TextStyle(fontSize: 12.sp, color: AppTheme.primaryColor),
        ));
  }

  ElevatedButton customiseButtonWidget(int index, BuildContext context, item) {
    return ElevatedButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: AppTheme.primaryColor, width: 0.5),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () async {
          CartItem? currentItem;
          for (var item in foodItemEatinController.selectedItems) {
            if (item.id == foodItemEatinController.data[index].id) {
              currentItem = foodItemEatinController.data[index];
            }
          }
          if (currentItem != null) {
            final result = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopUpCustomiseEatInScreen(
                  customiseItems: currentItem?.customiseModel ?? [],
                  listItem: foodItemEatinController.data,
                  index: index,
                );
              },
            );

            if (result != null) {
              setState(() {
                item.type = 0;
                item.quantity = 1;
              });
            }
            for (var item in foodItemEatinController.data) {
              foodItemEatinController.totalPrice.value =
                  foodItemEatinController.totalPrice.value +
                      (item.price * item.quantity);
              for (var element in item.customiseModel) {
                foodItemEatinController.totalPrice.value =
                    foodItemEatinController.totalPrice.value +
                        (element.customisePrice * element.customiseCount);
              }
            }

            _updateText(foodItemEatinController.totalPrice.value +
                foodItemEatinController.selectedItems[index].price);
            foodItemEatinController.selectedItem =
                foodItemEatinController.data[index];
          } else {
            final result = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopUpCustomiseEatInScreen(
                  customiseItems:
                      foodItemEatinController.data[index].customiseModel,
                  listItem: foodItemEatinController.data,
                  index: index,
                );
              },
            );

            if (result != null) {
              setState(() {
                item.type = 0;
                item.quantity = 1;
              });

              for (var element in result) {
                foodItemEatinController.totalPrice.value =
                    foodItemEatinController.totalPrice.value +
                        (element.customisePrice * element.customiseCount);
              }
              _updateText(foodItemEatinController.totalPrice.value +
                  foodItemEatinController.data[index].price);
            }
          }
        },
        child: Text(
          "Customise",
          style: TextStyle(fontSize: 12.sp, color: AppTheme.primaryColor),
        ));
  }

  Row incrementDecrementquantityWidget(item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: CircleAvatar(
            maxRadius: 12.r,
            backgroundColor: Colors.grey[600],
            foregroundColor: Colors.white,
            child: Icon(
              Icons.remove,
              size: 16.r,
            ),
          ),
          onPressed: () {
            setState(() {
              if (item.quantity == 1) {
                item.quantity--;
                double price = 0.00;
                price = item.price;
                for (var element in item.customiseModel) {
                  price =
                      price + (element.customiseCount * element.customisePrice);
                }
                foodItemEatinController.totalPrice.value =
                    foodItemEatinController.totalPrice.value - price;

                _updateText(foodItemEatinController.totalPrice.value);
              } else if (item.quantity > 0) {
                item.quantity--;
                foodItemEatinController.totalPrice.value =
                    foodItemEatinController.totalPrice.value - item.price;
              }

              if (item.quantity == 0) {
                item.type = item.iType;
              }
            });
          },
        ),
        SizedBox(
          width: 20.w,
          child: Text(
            item.quantity.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: CircleAvatar(
            maxRadius: 12.r,
            backgroundColor: Colors.grey[600],
            foregroundColor: Colors.white,
            child: Icon(
              Icons.add,
              size: 16.r,
            ),
          ),
          onPressed: () {
            setState(() {
              item.quantity++;
              log(item.price.toString());
              foodItemEatinController.totalPrice.value =
                  foodItemEatinController.totalPrice.value + item.price;

              _updateText(foodItemEatinController.totalPrice.value);
            });
          },
        ),
      ],
    );
  }

  Container categoryListViewWidget(Size size) {
    return Container(
      height: size.height / 7.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int index) {
          final ListItem item = listItems[index];
          return GestureDetector(
            onTap: () {
              foodItemEatinController.totalPrice.value = 0.00;
              foodItemEatinController.data.clear();
              // Update the page title when an item is clicked
              foodItemEatinController.title.value = item.title;
              // Update the list items when an item is clicked
              for (var item in item.subList) {
                foodItemEatinController.data.add(CartItem(
                    iType: item['type'],
                    id: item['id'],
                    type: item['type'],
                    customiseModel: [
                      CustomiseModel(
                          customiseTitle: "Shrimps",
                          customiseImage:
                              "https://img.freepik.com/free-photo/gambas-al-ajillo-prawn-based-dish-close-up-photography_53876-104575.jpg?w=740&t=st=1681027730~exp=1681028330~hmac=68f7ffd509819e6938a1bfcdd249fc26050ced416c4f3796f5424fb596c7026c",
                          customisePrice: 12.00,
                          customiseCount: 0),
                      CustomiseModel(
                          customiseTitle: "3 Pc Jalapeno Cheesy Bites",
                          customiseImage:
                              "https://img.freepik.com/free-photo/baked-clam-with-garlic-butter-served-with-garlic-bread-dark-background_1150-45280.jpg?w=1060&t=st=1681028312~exp=1681028912~hmac=6f2bca488dd465ade445e9e21cea56f3316bbab64fdde0ad521100ddb2210fac",
                          customisePrice: 9.00,
                          customiseCount: 0),
                      CustomiseModel(
                          customiseTitle: "3 Pcs Hot Lime Wings",
                          customiseImage:
                              "https://img.freepik.com/free-vector/chicken-fast-food-realistic-composition-with-black-background-flames-fire-pepper-leaves-chicken-wings-vector-illustration_1284-78833.jpg?w=1380&t=st=1682324537~exp=1682325137~hmac=91950bf8632c34ccd3a4ae539b317bc9f3d2d7f774286e39ca0a26ecc017ec94",
                          customisePrice: 9.00,
                          customiseCount: 0),
                      CustomiseModel(
                          customiseTitle: "Rice",
                          customiseImage:
                              "https://img.freepik.com/free-vector/hand-drawn-gopalkala-illustration_23-2148993446.jpg?w=740&t=st=1682324635~exp=1682325235~hmac=1f02d7754b2b60b5319ec715328e16394da7ce356da59f944af06e9b3f0e1318",
                          customisePrice: 7.00,
                          customiseCount: 0),
                      CustomiseModel(
                          customiseTitle: "Cookie",
                          customiseImage:
                              "https://img.freepik.com/free-vector/hand-drawn-chocolate-chip-cookies-vector_53876-161455.jpg?w=740&t=st=1682324701~exp=1682325301~hmac=34628b7c09d287f0ff021f10decb200128aeead42df554e23ce849f233fac501",
                          customisePrice: 6.00,
                          customiseCount: 0),
                      CustomiseModel(
                          customiseTitle: "2 Pcs Bun",
                          customiseImage:
                              "https://img.freepik.com/free-vector/bread-white-background_1308-103966.jpg?w=1060&t=st=1682324886~exp=1682325486~hmac=78db0fa24ebfcc658893e854af68d6ed720f01e0291c553ed964adcd29396d48",
                          customisePrice: 1.00,
                          customiseCount: 0)
                    ],
                    image: item['image'],
                    price: double.parse(item['price'].toString()),
                    quantity: 0,
                    title: item['foodName']));
              }
            },
            child: Container(
              width: size.width / 4.w,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    //category item image
                    CircleAvatar(
                      radius: 28.0.r,
                      backgroundImage: NetworkImage(item.imageUrl),
                    ),
                    SizedBox(height: 8.0.h),
                    //category item name
                    Padding(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      child: Center(
                        child: Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container appbarWidget(Size size) {
    return Container(
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
          Obx(
            () => Text(
              foodItemEatinController.title.value,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          const Spacer(),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  foodItemEatinController.totalPrice.value = 0.00;
                  foodItemEatinController.data.clear();
                  for (var item in widget.items) {
                    foodItemEatinController.data.add(CartItem(
                        iType: item['type'],
                        id: item['id'],
                        type: item['type'],
                        customiseModel: [
                          CustomiseModel(
                              customiseTitle: "Shrimps",
                              customiseImage:
                                  "https://img.freepik.com/free-photo/gambas-al-ajillo-prawn-based-dish-close-up-photography_53876-104575.jpg?w=740&t=st=1681027730~exp=1681028330~hmac=68f7ffd509819e6938a1bfcdd249fc26050ced416c4f3796f5424fb596c7026c",
                              customisePrice: 12.00,
                              customiseCount: 0),
                          CustomiseModel(
                              customiseTitle: "3 Pc Jalapeno Cheesy Bites",
                              customiseImage:
                                  "https://img.freepik.com/free-photo/baked-clam-with-garlic-butter-served-with-garlic-bread-dark-background_1150-45280.jpg?w=1060&t=st=1681028312~exp=1681028912~hmac=6f2bca488dd465ade445e9e21cea56f3316bbab64fdde0ad521100ddb2210fac",
                              customisePrice: 9.00,
                              customiseCount: 0),
                          CustomiseModel(
                              customiseTitle: "3 Pcs Hot Lime Wings",
                              customiseImage:
                                  "https://img.freepik.com/free-vector/chicken-fast-food-realistic-composition-with-black-background-flames-fire-pepper-leaves-chicken-wings-vector-illustration_1284-78833.jpg?w=1380&t=st=1682324537~exp=1682325137~hmac=91950bf8632c34ccd3a4ae539b317bc9f3d2d7f774286e39ca0a26ecc017ec94",
                              customisePrice: 9.00,
                              customiseCount: 0),
                          CustomiseModel(
                              customiseTitle: "Rice",
                              customiseImage:
                                  "https://img.freepik.com/free-vector/hand-drawn-gopalkala-illustration_23-2148993446.jpg?w=740&t=st=1682324635~exp=1682325235~hmac=1f02d7754b2b60b5319ec715328e16394da7ce356da59f944af06e9b3f0e1318",
                              customisePrice: 7.00,
                              customiseCount: 0),
                          CustomiseModel(
                              customiseTitle: "Cookie",
                              customiseImage:
                                  "https://img.freepik.com/free-vector/hand-drawn-chocolate-chip-cookies-vector_53876-161455.jpg?w=740&t=st=1682324701~exp=1682325301~hmac=34628b7c09d287f0ff021f10decb200128aeead42df554e23ce849f233fac501",
                              customisePrice: 6.00,
                              customiseCount: 0),
                          CustomiseModel(
                              customiseTitle: "2 Pcs Bun",
                              customiseImage:
                                  "https://img.freepik.com/free-vector/bread-white-background_1308-103966.jpg?w=1060&t=st=1682324886~exp=1682325486~hmac=78db0fa24ebfcc658893e854af68d6ed720f01e0291c553ed964adcd29396d48",
                              customisePrice: 1.00,
                              customiseCount: 0)
                        ],
                        image: item['image'],
                        price: double.parse(item['price']),
                        quantity: 0,
                        title: item['foodName']));
                  }

                  Get.to(CartEatInScreen(
                    foodItemEatInController: foodItemEatinController,
                  ));
                },
              ),
              Positioned(
                top: 8.0.h,
                right: 8.0.w,
                child: Obx(() {
                  return Badge(
                    child:
                        Text('${foodItemEatinController.cartItemCount.value}'),
                  );
                }),
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
    );
  }

  String? nullFunction() {
    return null;
  }
}
