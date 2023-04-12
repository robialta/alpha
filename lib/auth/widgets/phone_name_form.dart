import 'package:alpha/auth/auth_constants.dart';
import 'package:alpha/common/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PhoneNameForm extends StatelessWidget {
  PhoneNameForm({
    super.key,
    required this.goToSignInPage,
    required this.onDonde,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final Function goToSignInPage;
  final Function onDonde;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UnconstrainedBox(
          child: LimitedBox(
            maxWidth: 480,
            child: Column(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              'Please complete your registration for account ${FirebaseAuth.instance.currentUser!.email}',
                              style: kLoginSubtitleStyle(),
                            ),
                          ),
                        ),

                        TextFormField(
                          key: UniqueKey(),
                          style: kTextFormFieldStyle(),
                          controller: fullNameController,
                          decoration: const InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.account_box),
                            hintText: 'Full Name',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter full name';
                              // } else if (!value.endsWith('@gmail.com')) {
                              //   return 'Please enter valid gmail';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
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
                            // if (value == null || value.isEmpty) {
                            //   return 'Please enter phone number';
                            // }
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
                            text: 'Or',
                            style: const TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: ' Login',
                                style: kLoginOrSignUpTextStyle(),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (context.mounted) {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    await FirebaseAuth.instance.signOut();
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                    goToSignInPage();
                                  },
                              ),
                              const TextSpan(text: ' using another account')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
                await FirebaseAuth.instance.currentUser
                    ?.updateDisplayName(fullNameController.text);
                if (context.mounted) Navigator.of(context).pop();
                onDonde();
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
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
