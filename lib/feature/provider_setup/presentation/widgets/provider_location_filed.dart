import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/provider_setup_cubit.dart';
import '../cubit/provider_setup_state.dart';

class ProviderLocationField extends StatelessWidget {
  const ProviderLocationField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderSetupCubit, ProviderSetupState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 8.h),

            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await context.read<ProviderSetupCubit>().getCurrentLocation();
                },
                icon: const Icon(Icons.my_location),
                label: Text(
                  state.latitude == null
                      ? 'Use Current Location'
                      : 'Location Selected',
                ),
              ),
            ),

            if (state.latitude != null && state.longitude != null) ...[
              SizedBox(height: 10.h),

              Text(
                'Latitude: ${state.latitude}',
                style: TextStyle(fontSize: 14.sp),
              ),

              Text(
                'Longitude: ${state.longitude}',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ],
        );
      },
    );
  }
}
