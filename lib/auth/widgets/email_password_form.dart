import 'package:alpha/auth/auth_constants.dart';
import 'package:alpha/auth/widgets/password_field_widget.dart';
import 'package:alpha/common/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EmailPasswordForms extends StatelessWidget {
  EmailPasswordForms({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.passwordController2,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordController2;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Create Account',
              style: kLoginSubtitleStyle(),
            ),
          ),

          TextFormField(
            key: UniqueKey(),
            style: kTextFormFieldStyle(),
            controller: emailController,
            decoration: const InputDecoration(
              filled: true,
              prefixIcon: Icon(Icons.email_rounded),
              hintText: 'Gmail',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter gmail';
              } else if (!value.endsWith('@gmail.com')) {
                return 'Please enter valid gmail';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 12,
          ),

          /// password
          PasswordField(
            key: UniqueKey(),
            hitnText: 'Password',
            passwordController: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              } else if (value.length < 7) {
                return 'At least enter 6 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          /// password
          PasswordField(
            key: UniqueKey(),
            hitnText: 'Repeat password',
            passwordController: passwordController2,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please repeat password';
              } else if (value != passwordController.text) {
                return 'Password not match';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
            style: kLoginTermsAndPrivacyStyle(),
            textAlign: TextAlign.center,
          ),

          /// SignUp Button
          signUpButton(context),

          /// Navigate To Login Screen
          RichText(
            text: TextSpan(
              text: 'Already have an account?',
              style: const TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: ' Login',
                  style: kLoginOrSignUpTextStyle(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: () async {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // final bool? isVerified = await showDialog<bool>(
              //   context: context,
              //   barrierDismissible: false,
              //   builder: (context) => Dialog(
              //     backgroundColor: grey100,
              //     child: PhoneVerification(
              //       phoneController: _phoneController,
              //     ),
              //   ),
              // );

              if (context.mounted) {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
                // FirebaseAuth.instance.();

                if (context.mounted) Navigator.of(context).pop();
              } on FirebaseAuthException catch (e) {
                if (context.mounted) Navigator.of(context).pop();
                if (context.mounted) {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.error(
                      message: e.message ??
                          'Something went wrong. Please check your credentials and try again',
                    ),
                    displayDuration: const Duration(milliseconds: 4000),
                  );
                }
              }
            }
          },
          child: const Text('Sign up'),
        ),
      ),
    );
  }
}
