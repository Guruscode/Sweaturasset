import 'package:flutter/material.dart';
import 'package:swa/core/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? blueColor,
    );
  }
}
