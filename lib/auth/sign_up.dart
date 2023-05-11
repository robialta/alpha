import 'package:alpha/auth/widgets/email_password_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordController2;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordController2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Image.asset(
              'assets/images/alpha1.png',
              scale: 3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: EmailPasswordForms(
            emailController: _emailController,
            passwordController: _passwordController,
            passwordController2: _passwordController2,
          ),
        ),
      ],
    );
  }
}
