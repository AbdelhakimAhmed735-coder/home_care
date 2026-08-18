import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_care/feature/account_setup/presentation/screens/account_type_screen.dart';
import 'package:home_care/feature/auth/signup_ui/screens/signup.dart';

import 'package:home_care/feature/home/provider_screen/presentation/provideer_home_screen.dart';

import 'login_controller.dart';
import 'login_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final LoginController controller = LoginController();

  bool obscurePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    final error = await controller.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    if (error == null) {
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

  Future<void> forgotPassword() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter your email first')));
      return;
    }

    final error = await controller.forgotPassword(email);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error ?? 'Password reset email sent 📩'),
        backgroundColor: error == null ? Colors.green : Colors.red,
      ),
    );
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
                Image.asset('assets/splash/splash_Frame.png', width: 100.w),

                const Gap(40),

                const Text(
                  'Enter your email and password to\nlogin',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 73, 67, 67),
                  ),
                ),

                const Gap(24),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your email';
                    }

                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.mail_outline),
                    border: OutlineInputBorder(),
                  ),
                ),

                const Gap(12),

                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline),
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
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: forgotPassword,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
                    ),
                  ),
                ),

                const Gap(8),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
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
                            'Log In',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),

                const Gap(20),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'New to fixit? ',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Sign Up Now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Gap(20),

                Row(
                  children: [
                    const Expanded(child: Divider()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Or'),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                const Gap(18),

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
