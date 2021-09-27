import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        width: double.infinity,
        height: 32.sp,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          child: Padding(
            padding: EdgeInsets.all(5.sp),
            child: isLoading
                ? const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                    strokeWidth: 2,
                  )
                : Text(
                    text,
                    style: TextStyle(fontSize: 18.sp),
                  ),
          ),
        ),
      ),
    );
  }
}
