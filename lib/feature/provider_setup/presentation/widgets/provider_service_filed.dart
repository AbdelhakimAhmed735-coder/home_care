import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../cubit/provider_setup_cubit.dart';

class ProviderServiceField extends StatelessWidget {
  const ProviderServiceField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Service',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Gap(8.h),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            hintText: 'Select your service',
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 'Plumber', child: Text(' 🔧 Plumber')),
            DropdownMenuItem(
              value: 'Electrician',
              child: Text('⚡ Electrician'),
            ),
            DropdownMenuItem(value: 'Carpenter', child: Text(' ⚙️ Carpenter')),
            DropdownMenuItem(value: 'Painter', child: Text(' 🎨 Painter')),
            DropdownMenuItem(
              value: 'AC Technician',
              child: Text('🚚 AC Technician'),
            ),
            DropdownMenuItem(value: 'Cleaner', child: Text('🧹Cleaner')),
          ],
          onChanged: (value) {
            if (value != null) {
              context.read<ProviderSetupCubit>().updateService(value);
            }
          },
        ),
      ],
    );
  }
}
