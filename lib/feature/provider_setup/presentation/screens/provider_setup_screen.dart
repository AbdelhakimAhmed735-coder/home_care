import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_care/feature/provider_setup/presentation/widgets/provider_experince_filed.dart';
import 'package:home_care/feature/provider_setup/presentation/widgets/provider_location_filed.dart';

import '../cubit/provider_setup_cubit.dart';
import '../widgets/provider_name_filed.dart';
import '../widgets/provider_phone_filed.dart';
import '../widgets/provider_service_filed.dart';
import '../widgets/provider_setup_button.dart';

class ProviderSetupScreen extends StatelessWidget {
  const ProviderSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProviderSetupCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Provider Setup')),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const ProviderSetupForm(),
        ),
      ),
    );
  }
}

class ProviderSetupForm extends StatelessWidget {
  const ProviderSetupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(30.h),

        Center(child: Image.asset('assets/icon/app_icon1.png', width: 100.w)),

        Gap(20.h),

        const ProviderNameField(),

        Gap(20.h),

        const ProviderPhoneField(),

        Gap(20.h),

        const ProviderServiceField(),

        Gap(25.h),

        ProviderExperinceFiled(),

        Gap(25.h),

        ProviderLocationField(),

        Gap(40.h),

        ProviderSetupButton(
          onPressed: () {
            // هنضيف الحفظ هنا
          },
        ),
      ],
    );
  }
}
