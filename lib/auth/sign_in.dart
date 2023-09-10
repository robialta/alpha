import 'package:alpha/auth/auth_constants.dart';
import 'package:alpha/auth/widgets/password_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: _buildMainScreen());
  }

  Widget _buildMainScreen() {
    return Center(
      child: UnconstrainedBox(
        child: LimitedBox(
          maxWidth: 480,
          child: SingleChildScrollView(
            child: _buildLoginScreen(),
          ),
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
                  textAlign: TextAlign.center,
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
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/register', (route) => false);
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
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: () async {
            // Validate returns true if the form is valid, or false otherwise.
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
