import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProviderGallery extends StatelessWidget {
  const ProviderGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/icon/app_icon.png',
      'assets/onbording/conter.png',
      'assets/onbording/human services1.png',
      'assets/onbording/humen servicc3.png',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gallery',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // TODO: View all gallery
              },
              child: Text('View all', style: TextStyle(fontSize: 13.sp)),
            ),
          ],
        ),

        Gap(8.h),

        SizedBox(
          height: 85.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (_, __) => Gap(10.w),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  images[index],
                  width: 90.w,
                  height: 85.h,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
