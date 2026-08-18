import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_care/feature/home/provider_screen/presentation/provider_details/widgets/book_button.dart';
import 'package:home_care/feature/home/provider_screen/presentation/provider_details/widgets/provider_states.dart';

import 'widgets/provider_header.dart';

import 'widgets/provider_skills.dart';

import 'widgets/provider_bio.dart';
import 'widgets/provider_gallery.dart';
import 'widgets/provider_reviews.dart';

class ProviderDetailsScreen extends StatelessWidget {
  const ProviderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Provider Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProviderHeader(),

            Gap(20.h),

            const ProviderStats(),

            Gap(20.h),

            const ProviderSkills(),

            Gap(20.h),

            const BookButton(),

            Gap(24.h),

            const ProviderBio(),

            Gap(24.h),

            const ProviderGallery(),

            Gap(24.h),

            const ProviderReviews(),
          ],
        ),
      ),
    );
  }
}
