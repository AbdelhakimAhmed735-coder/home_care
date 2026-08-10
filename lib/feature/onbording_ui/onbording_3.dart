import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/app_colors.dart';
import 'package:home_care/feature/auth/auth_wrapper.dart';
import 'package:home_care/feature/auth/login_ui/login.dart';

class Onbording3 extends StatelessWidget {
  const Onbording3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColors,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gap(50.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/onbording/counter3.png'),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthWrapper(),
                          ),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/onbording/humen servicc3.png'),
              Gap(30.h),
              Text(
                "Welcome to fixit",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Gap(40.h),
              Text(
                "Browse and book a wide range of services from plumbing and electrical to appliance repair. We've got it all covered",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              Gap(50.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Container(
                  width: 350.w,
                  height: 70.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 34, 101, 156),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
