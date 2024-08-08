import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/models/courses.dart';
import 'package:swa/features/auth/views/widgets/button_widget.dart';
import 'package:swa/features/dashboard/views/widgets/bottom_bar.dart';

class ConfirmPayment extends StatefulWidget {
  final int selected;
  final CoursesModel course;

  const ConfirmPayment(
      {super.key, required this.selected, required this.course});

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  @override
  Widget build(BuildContext context) {
    // Define the payment options map
    final Map<int, Widget> paymentOptions = {
      1: Card(
        color: Colors.white,
        child: RadioListTile(
          title: const Text(
            'Paypal',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          secondary: Image.asset('assets/images/PayPal.png'),
          value: 1,
          groupValue: widget.selected,
          onChanged: (int? value) {},
        ),
      ),
      2: Card(
        color: Colors.white,
        child: RadioListTile(
          title: const Text(
            'Google Pay',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          secondary: Image.asset('assets/images/GooglePay.png'),
          value: 2,
          groupValue: widget.selected,
          onChanged: (int? value) {},
        ),
      ),
      3: Card(
        color: Colors.white,
        child: RadioListTile(
          title: const Text(
            'Apple Pay',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          secondary: Image.asset('assets/images/ApplePay.png'),
          value: 3,
          groupValue: widget.selected,
          onChanged: (int? value) {},
        ),
      ),
      4: Card(
        color: Colors.white,
        child: RadioListTile(
          title: const Text(
            '**** ****  **76  3054',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          secondary: Image.asset('assets/images/Mastercard.png'),
          value: 4,
          groupValue: widget.selected,
          onChanged: (int? value) {},
        ),
      ),
    };

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (paymentOptions.containsKey(widget.selected))
              paymentOptions[widget.selected]!,
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Text(
                  'Change payment method',
                  style: TextStyle(
                    color: blueColor,
                    decoration: TextDecoration.underline,
                    decorationColor: blueColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order summary',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                            ),
                          ),
                          Text(
                            widget.course.name ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Type',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                            ),
                          ),
                          const Text(
                            'Article',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                            ),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Total price: N${widget.course.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ButtonWidget(
                      bgColor: blueColor,
                      onPressed: () {
                        Get.defaultDialog(
                          title: '',
                          content: Container(
                            padding: EdgeInsets.all(10),
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
                                    Get.offAll(() => const AppBottomBar(),);
                                  },
                                  text: " Proceed to Learn",
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      text: 'Proceed to Pay',
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
