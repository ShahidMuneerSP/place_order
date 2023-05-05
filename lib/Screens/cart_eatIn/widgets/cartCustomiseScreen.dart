import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Theme/apptheme.dart';

class CartCustomiseScreen extends StatefulWidget {
  final List customiseItems;
  final double initialText;
  final int index;
  final List listItems;

  const CartCustomiseScreen(
      {super.key,
      required this.initialText,
      required this.index,
      required this.listItems,
      required this.customiseItems});

  @override
  // ignore: library_private_types_in_public_api
  _CartCustomiseScreenState createState() => _CartCustomiseScreenState();
}

class _CartCustomiseScreenState extends State<CartCustomiseScreen> {
  double _totalPrice = 0.0;
  double price = 0.0;

  @override
  void initState() {
    _totalPrice = widget.initialText;
    price = widget.initialText;
    log(_totalPrice.toString());
    log(price.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Dialog(
      child: SizedBox(
        height: size.height * 0.51,
        child: Container(
          margin: EdgeInsets.only(top: 10.h, left: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add On",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              Expanded(
                child: cartCustomiseItemsListView(size),
              ),
              const Divider(),
              Container(
                height: size.width / 7.h,
                child: popupRowBottomWidget(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row popupRowBottomWidget(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(color: AppTheme.primaryColor, width: 0.5),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: AppTheme.primaryColor, fontSize: 10.sp),
            )),
        const Spacer(),
        Text(
          'AED ${_totalPrice.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.primaryColor)),
              onPressed: () {
                Navigator.pop(context, _totalPrice);
              },
              child: Text(
                "Add To Order",
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              )),
        ),
      ],
    );
  }

  ListView cartCustomiseItemsListView(Size size) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.customiseItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Container(
                height: size.height / 19.h,
                width: size.width / 11.w,
                child: Image.network(
                    widget.customiseItems[index].customiseImage ?? "")),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                widget.customiseItems[index].customiseTitle ?? "",
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              "+ AED ${widget.customiseItems[index].customisePrice}",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.remove,
                size: 17.r,
              ),
              onPressed: () {
                setState(() {
                  if (widget.customiseItems[index].customiseCount > 0) {
                    widget.customiseItems[index].customiseCount =
                        widget.customiseItems[index].customiseCount! - 1;
                    _totalPrice -=
                        widget.customiseItems[index].customisePrice ?? 0.00;
                    price -=
                        widget.customiseItems[index].customisePrice ?? 0.00;
                  }
                });
              },
            ),
            Text(
              "${widget.customiseItems[index].customiseCount}",
              style: TextStyle(fontSize: 11.sp),
            ),
            IconButton(
                icon: Icon(
                  Icons.add,
                  size: 17.r,
                ),
                onPressed: () {
                  setState(() {
                    widget.customiseItems[index].customiseCount =
                        widget.customiseItems[index].customiseCount! + 1;
                    log(widget.customiseItems[index].customiseCount.toString());
                    _totalPrice +=
                        widget.customiseItems[index].customisePrice ?? 0.00;
                    price +=
                        widget.customiseItems[index].customisePrice ?? 0.00;
                  });
                }),
          ],
        );
      },
    );
  }
}
