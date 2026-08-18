import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../cubit/provider_setup_cubit.dart';

class ProviderPhoneField extends StatelessWidget {
  const ProviderPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Gap(8.h),
        // TextField(
        //   keyboardType: TextInputType.phone,
        //   onChanged: (value) {
        //     context.read<ProviderSetupCubit>().updatePhone(value);
        //   },
        //   decoration: const InputDecoration(
        //     hintText: 'Enter your phone number',
        //     border: OutlineInputBorder(),
        //   ),
        // ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: CountryCodePicker(
                initialSelection: 'EG',
                favorite: const ['EG', 'SA', 'AE'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                onChanged: (country) {
                  print(country.dialCode);
                },
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  context.read<ProviderSetupCubit>().updatePhone(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
