import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_care/feature/account_setup/presentation/cubit/account_setup_cubit.dart';
import 'package:home_care/feature/account_setup/presentation/cubit/account_setup_state.dart';
import 'package:home_care/feature/account_setup/presentation/widgets/account_type.dart';
import 'package:home_care/feature/account_setup/presentation/widgets/account_type_card.dart';
import 'package:home_care/feature/provider_setup/presentation/screens/provider_setup_screen.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountSetupCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BlocBuilder<AccountSetupCubit, AccountSetupState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(30.h),

                    Center(
                      child: Image.asset(
                        'assets/icon/app_icon1.png',
                        width: 100.w,
                      ),
                    ),

                    Gap(35.h),

                    const Text(
                      'I am',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Gap(40.h),

                    AccountTypeCard(
                      title: 'Service Provider',
                      subtitle: 'I offer professional services.',
                      isSelected:
                          state.accountType == AccountType.serviceProvider,
                      onTap: () {
                        context.read<AccountSetupCubit>().selectAccountType(
                          AccountType.serviceProvider,
                        );
                      },
                    ),

                    Gap(20.h),

                    AccountTypeCard(
                      title: 'Looking For Service',
                      subtitle: 'I am looking for home services.',
                      isSelected:
                          state.accountType == AccountType.lookingForService,
                      onTap: () {
                        context.read<AccountSetupCubit>().selectAccountType(
                          AccountType.lookingForService,
                        );
                      },
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: state.accountType == null
                            ? null
                            : () {
                                if (state.accountType ==
                                    AccountType.serviceProvider) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProviderSetupScreen(),
                                    ),
                                  );
                                } else {
                                  // Navigate to Looking For Service setup
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Next'),
                      ),
                    ),

                    Gap(25.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
