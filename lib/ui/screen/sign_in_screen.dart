import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 82,
                ),
                Text(
                  'Get Started With',
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildSignInForm(),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: _onTapForgotPasswordButton,
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey),
                          )),
                      _buildSignUpSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapForgotPasswordButton() {
    //TODO: Implement OnTap Forgot Password.
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.5),
          text: "Don't Have an account? ",
          children: [
            TextSpan(
                text: 'Sign up',
                style: const TextStyle(
                  color: AppColors.themeColor,
                ),recognizer: TapGestureRecognizer()..onTap = _onTapSignUp
            ),
          ]),
    );
  }

// Method Extraction
  Widget _buildSignInForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapNextButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }

  void _onTapNextButton() {
    //Todo : On Tap next Button
  }

  void _onTapSignUp() {
    //Todo : On Tap next Button
  }
}
