import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:swa/core/constants/const.dart';
import 'package:paystack_for_flutter/paystack_for_flutter.dart';
import 'package:swa/features/auth/views/widgets/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/features/dashboard/views/widgets/bottom_bar.dart';

class PaymentController extends GetxController {
  final uniqueTransRef = PayWithPayStack().generateUuidV4();
  bool isLoading = false;

  void loading() {
    isLoading = !isLoading;
    update();
  }

  void processWithPayStack(BuildContext context, double amount, String email,
      int courseId, int userId) async {
    // purchaseCourse
    var res = await purchaseCourse(courseId: courseId.toString(), userId: userId.toString());
    if (res == 'purchased') {
      Get.snackbar(
        'Error',
        'Already purchased',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (res == 'error') {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      PaystackFlutter().pay(
        context: context,
        secretKey:
            'sk_test_5f370b513d0c9737d0bc6399678be86fbc9e018e', // Your Paystack secret key gotten from your Paystack dashboard.
        amount: amount *
            100, // The amount to be charged in the smallest currency unit. If amount is 600, multiply by 100(600*100)
        email: email, // The customer's email address.
        callbackUrl:
            'https://callback.com', // The URL to which Paystack will redirect the user after the transaction.
        showProgressBar:
            true, // If true, it shows progress bar to inform user an action is in progress when getting checkout link from Paystack.
        paymentOptions: [
          PaymentOption.card,
          PaymentOption.bankTransfer,
          PaymentOption.mobileMoney
        ],
        currency: Currency.NGN,
        // metaData: {
        //   "product_name": "Nike Sneakers",
        //   "product_quantity": 3,
        //   "product_price": 24000
        // }, // Additional metadata to be associated with the transaction
        onSuccess: (paystackCallback) {
          Get.defaultDialog(
            title: '',
            content: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/done.png',
                    scale: 2.0,
                  ),
                  Text(
                    'Congratulations',
                    style: GoogleFonts.jost(
                      color: const Color(0xff202244),
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Your payment was successful',
                    style: GoogleFonts.jost(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'View receipt',
                    style: GoogleFonts.jost(
                      color: const Color(0xff219653),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xff219653),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ButtonWidget(
                    bgColor: const Color(0xff219653),
                    onPressed: () {
                      Get.offAll(
                        () => const AppBottomBar(),
                      );
                    },
                    text: " Proceed to Learn",
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          );
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content:
          //       Text('Transaction Successful::::${paystackCallback.reference}'),
          //   backgroundColor: Colors.blue,
          // ));
        }, // A callback function to be called when the payment is successful.
        onCancelled: (paystackCallback) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Transaction Failed/Not successful::::${paystackCallback.reference}'),
            backgroundColor: Colors.red,
          ));
        }, // A callback function to be called when the payment is canceled.
      );
    }
  }

  Future<String> purchaseCourse(
      {required String courseId, required String userId}) async {
    loading();
    try {
      var response = await http.post(
        Uri.parse('$apiUrl/purchase'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'course_id': courseId,
          'user_id': userId,
        },
      );
      var res = jsonDecode(response.body);
      print(res);
      if (response.statusCode == 200) {
        return 'success';
      } else if (response.statusCode == 400) {
        return 'purchased';
      } else {
        return 'error';
      }
    } catch (e) {
      print(e.toString());
      return 'error';
    } finally {
      loading();
    }
  }
}
