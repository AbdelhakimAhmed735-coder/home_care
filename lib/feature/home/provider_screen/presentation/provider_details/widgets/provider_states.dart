import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderStats extends StatelessWidget {
  const ProviderStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StatItem(icon: Icons.star, value: '4.8', title: 'Rating'),
        _StatItem(
          icon: Icons.check_circle_outline,
          value: '56',
          title: 'Orders',
        ),
        _StatItem(
          icon: Icons.work_outline,
          value: '4 Years',
          title: 'Experience',
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String title;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24.sp),
        SizedBox(height: 6.h),
        Text(
          value,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
