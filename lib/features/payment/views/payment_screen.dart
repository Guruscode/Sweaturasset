import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/models/courses.dart';
import 'package:swa/features/auth/views/widgets/button_widget.dart';
import 'package:swa/features/dashboard/views/widgets/quick_pick_widget.dart';
import 'package:swa/features/payment/views/confirm_payment.dart';

class PaymentPage extends StatefulWidget {
  final CoursesModel course;

  const PaymentPage({super.key, required this.course});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Payment'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 18.0,
        ),
        child: Column(
          children: [
            QuickPickWidget(
              model: widget.course,
              showPay: false,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Select the Payment Methods you Want to Use',
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              color: Colors.white,
              child: RadioListTile(
                title: const Text(
                  'Paypal',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                secondary: Image.asset('assets/images/PayPal.png'),
                value: 1,
                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              color: Colors.white,
              child: RadioListTile(
                title: const Text(
                  'Google Pay',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                secondary: Image.asset('assets/images/GooglePay.png'),
                value: 2,
                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              color: Colors.white,
              child: RadioListTile(
                title: const Text(
                  'Apple Pay',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                secondary: Image.asset('assets/images/ApplePay.png'),
                value: 3,
                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              color: Colors.white,
              child: RadioListTile(
                title: const Text(
                  '**** ****  **76  3054',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                secondary: Image.asset('assets/images/Mastercard.png'),
                value: 4,
                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ButtonWidget(
              bgColor: blueColor,
              onPressed: () {
                Get.to(
                  () => ConfirmPayment(
                    selected: _selectedValue,
                    course: widget.course,
                  ),
                );
              },
              text: 'Next',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
