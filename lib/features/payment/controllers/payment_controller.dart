import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:swa/core/constants/const.dart';

class PaymentController extends GetxController {
  final uniqueTransRef = PayWithPayStack().generateUuidV4();
  bool isLoading = false;

  void loading() {
    isLoading = !isLoading;
    update();
  }

  void processWithPayStack(BuildContext context) {
    PayWithPayStack().now(
        context: context,
        secretKey:
        "sk_live_XXXXXXXXXXXXXXXXXXXXXXXXXXXX",
        customerEmail: "your@email.com",
        reference:uniqueTransRef,
        callbackUrl: "setup in your paystack dashboard",
        currency: "NG",
        paymentChannel:["mobile_money", "card"],
        amount: 2000,
        transactionCompleted: () {
          print("Transaction Successful");
        },
        transactionNotCompleted: () {
          print("Transaction Not Successful!");
        });
  }

  Future<String> purchaseCourse({required String courseId, required String userId}) async {
    loading();
    try {
      var response = await http.post(
        Uri.parse('$apiUrl/purchase'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'course_id' : courseId,
          'user_id' : userId,
        },
      );
      var res = jsonDecode(response.body);
      print(res);
      if(response.statusCode == 200) {
        return 'success';
      }else if(response.statusCode == 400) {
        return 'purchased';
      }else{
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
