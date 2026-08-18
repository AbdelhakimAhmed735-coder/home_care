import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProviderSkills extends StatelessWidget {
  const ProviderSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = ['Sink', 'Shower', 'Boiler', 'Toilet'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        Gap(10.h),

        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: skills.map((skill) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(skill, style: TextStyle(fontSize: 13.sp)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
