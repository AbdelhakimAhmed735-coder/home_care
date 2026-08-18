import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../cubit/provider_setup_cubit.dart';

class ProviderNameField extends StatelessWidget {
  const ProviderNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country ',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Gap(8.h),
        TextField(
          onChanged: (value) {
            context.read<ProviderSetupCubit>().updateName(value);
          },
          decoration: const InputDecoration(
            hintText: 'Enter your country',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
