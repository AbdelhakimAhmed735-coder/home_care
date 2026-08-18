import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProviderBio extends StatelessWidget {
  const ProviderBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bio',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        Gap(8.h),

        Text(
          'I am a dedicated professional with several years of experience. '
          'I provide high-quality services and always focus on customer '
          'satisfaction and delivering the best results.',
          style: TextStyle(
            fontSize: 14.sp,
            height: 1.5,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
