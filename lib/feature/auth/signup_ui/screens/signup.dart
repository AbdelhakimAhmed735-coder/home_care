import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_care/feature/account_setup/presentation/screens/account_type_screen.dart';
import 'package:home_care/feature/auth/login_ui/login_widgets.dart';
import 'package:home_care/feature/auth/signup_ui/signup_controller.dart';
import 'package:home_care/feature/auth/signup_ui/signup_validator.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final SignupController controller = SignupController();

  bool obscurePassword = true;
  bool isLoading = false;
  bool agreeTerms = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    if (!agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to Terms & Conditions'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final error = await controller.register(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    if (error == null) {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(
        nameController.text.trim(),
      );

      await FirebaseAuth.instance.currentUser?.reload();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AccountTypeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/splash/splash_Frame.png', width: 100),

                const Gap(28),

                const Text(
                  'Create your account and get started',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF555555),
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Gap(24),

                TextFormField(
                  controller: nameController,
                  validator: SignupValidator.name,
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    prefixIcon: const Icon(
                      Icons.account_circle_outlined,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xFF0560B9)),
                    ),
                  ),
                ),

                const Gap(10),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: SignupValidator.email,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.mail_outline, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xFF0560B9)),
                    ),
                  ),
                ),

                const Gap(10),

                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  validator: SignupValidator.password,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.lock_outline, size: 20),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xFF0560B9)),
                    ),
                  ),
                ),

                const Gap(10),

                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: agreeTerms,
                        onChanged: (value) {
                          setState(() {
                            agreeTerms = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF0560B9),
                      ),
                    ),

                    const Gap(5),

                    const Text(
                      'I Agree With FixIt\'s ',
                      style: TextStyle(fontSize: 11, color: Color(0xFF555555)),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Term & Conditions',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF0560B9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(14),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0560B9),
                      disabledBackgroundColor: const Color(0xFF8CB7DD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 0,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const Gap(20),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 11,
                      ),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Log in now',
                              style: TextStyle(
                                color: Color(0xFF0560B9),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Gap(22),

                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFE5E5E5))),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ),

                    const Expanded(child: Divider(color: Color(0xFFE5E5E5))),
                  ],
                ),

                const Gap(16),

                const Center(
                  child: Text(
                    'Sign up with',
                    style: TextStyle(fontSize: 11, color: Color(0xFF666666)),
                  ),
                ),

                const Gap(12),

                Row(
                  children: [
                    Expanded(
                      child: SocialButton(
                        icon: Icons.g_mobiledata,
                        text: 'Google',
                        onTap: () {},
                      ),
                    ),

                    const Gap(12),

                    Expanded(
                      child: SocialButton(
                        icon: Icons.facebook,
                        text: 'Facebook',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
