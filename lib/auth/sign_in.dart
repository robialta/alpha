import 'package:alpha/auth/auth_constants.dart';
import 'package:alpha/auth/widgets/password_field_widget.dart';
import 'package:alpha/auth/widgets/varification.dart';
import 'package:alpha/common/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isSignUpPage = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildMainScreen());
  }

  /// For Small screens
  Widget _buildMainScreen() {
    return Center(
      child: UnconstrainedBox(
        child: LimitedBox(
          maxWidth: 600,
          child: _isSignUpPage ? _buildSignupPage() : _buildLoginScreen(),
        ),
      ),
    );
  }

  Widget _buildSignupPage() => Column(
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
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Create Account',
              style: kLoginSubtitleStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: UniqueKey(),
                    style: kTextFormFieldStyle(),
                    controller: phoneController,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Phone',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                        // } else if (!value.endsWith('@gmail.com')) {
                        //   return 'Please enter valid gmail';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  /// Gmail
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
                  signUpButton(),

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
                            ..onTap = () => _goToSignInPage(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget signUpButton() {
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
              final bool? isVerified = await showDialog<bool>(
                context: context,
                barrierDismissible: false,
                builder: (context) => Dialog(
                  backgroundColor: grey100,
                  child: PhoneVerification(
                    phoneController: phoneController,
                  ),
                ),
              );
              if (isVerified!) {
                if (context.mounted) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
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

  /// Main Body
  Widget _buildLoginScreen() {
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
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Welcome Back',
            style: kLoginSubtitleStyle(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// username or Gmail
                TextFormField(
                  key: UniqueKey(),

                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email_rounded),
                    hintText: 'Email',
                  ),
                  controller: emailController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter gmail';
                    } else if (!value.endsWith('@gmail.com')) {
                      return 'please enter valid gmail';
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
                const SizedBox(
                  height: 16,
                ),

                Text(
                  'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                  style: kLoginTermsAndPrivacyStyle(),
                  textAlign: TextAlign.center,
                ),

                /// Login Button
                loginButton(),

                /// Navigate To Login Screen
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: ' Sign up, ',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => _goToSignUpPage(),
                        style: kLoginOrSignUpTextStyle(),
                      ),
                      const TextSpan(text: 'or '),
                      TextSpan(
                        text: 'reset password ',
                        style: kLoginOrSignUpTextStyle(),
                      ),
                      const TextSpan(text: 'if you forgot your password')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _goToSignUpPage() {
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    passwordController2.clear();
    setState(() {
      _isSignUpPage = true;
    });
  }

  void _goToSignInPage() {
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    passwordController2.clear();
    setState(() {
      _isSignUpPage = false;
    });
  }

  // Login Button
  Widget loginButton() {
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
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
                if (context.mounted) Navigator.of(context).pop();
              } on FirebaseAuthException catch (e) {
                Navigator.of(context).pop();
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
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
