import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ProviderHeader extends StatefulWidget {
  const ProviderHeader({super.key});

  @override
  State<ProviderHeader> createState() => _ProviderHeaderState();
}

class _ProviderHeaderState extends State<ProviderHeader> {
  File? profileImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: pickImage,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 55.r,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!)
                    : null,
                child: profileImage == null
                    ? Icon(Icons.person, size: 55.sp)
                    : null,
              ),

              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(7.w),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ),

        Gap(12.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FirebaseAuth.instance.currentUser?.displayName ?? 'Provider Name',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            Gap(10.w),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.phone_outlined, size: 22.sp),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border, size: 22.sp),
            ),
          ],
        ),

        Gap(4.h),

        Text(
          'Plumber',
          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
