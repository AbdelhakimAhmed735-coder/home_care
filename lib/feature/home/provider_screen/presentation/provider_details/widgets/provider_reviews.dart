import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProviderReviews extends StatelessWidget {
  const ProviderReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        Gap(12.h),

        const _ReviewItem(
          name: 'John Peter',
          review: 'Great service and very professional.',
          rating: 5,
        ),

        Gap(12.h),

        const _ReviewItem(
          name: 'Caleb',
          review: 'Excellent work and very helpful.',
          rating: 5,
        ),
      ],
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final String name;
  final String review;
  final int rating;

  const _ReviewItem({
    required this.name,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22.r,
          child: Icon(Icons.person, size: 22.sp),
        ),

        Gap(10.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),

              Gap(4.h),

              Row(
                children: List.generate(
                  rating,
                  (index) => Icon(Icons.star, size: 16.sp),
                ),
              ),

              Gap(4.h),

              Text(
                review,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
