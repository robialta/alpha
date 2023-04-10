import 'package:alpha/auth/auth_constants.dart';
import 'package:alpha/common/constant/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  bool isValidationCodeSent = false;
  late String otp = '';
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: LimitedBox(
        maxWidth: 500,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child:
              isValidationCodeSent ? _enterCodePage() : _phoneValidationPage(),
        ),
      ),
    );
  }

  Widget _enterCodePage() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Verification code was sent to your number ${widget.phoneController.text}, please enter the code below',
            style: kLoginTermsAndPrivacyStyle(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: OtpPinField(
              onChange: (text) {
                otp = text;
              },
              onSubmit: (value) {},
              cursorColor: Colors.white,
              otpPinFieldStyle: OtpPinFieldStyle(
                  textStyle: Theme.of(context).textTheme.titleLarge!,
                  activeFieldBorderColor: primary,
                  defaultFieldBorderColor: Colors.white),
            ),
          ),

          Padding(
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
                  Navigator.of(context).pop(true);
                },
                child: const Text('Verify'),
              ),
            ),
          ),

          /// Navigate To Login Screen
          RichText(
            text: TextSpan(
              text: 'Did not recieve the code?',
              style: const TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: ' Resend',
                  style: kLoginOrSignUpTextStyle(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.of(context).pop(),
                ),
                TextSpan(
                  text: ' in 30',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _phoneValidationPage() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'We are about to send verification code to your phone number, make sure your number is valid!',
            style: kLoginTermsAndPrivacyStyle(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.phoneController.text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          Padding(
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
                  setState(() {
                    isValidationCodeSent = true;
                  });
                },
                child: const Text('Send verification code'),
              ),
            ),
          ),

          /// Navigate To Login Screen
          RichText(
            text: TextSpan(
              text: 'Invalid number?',
              style: const TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: ' Change number',
                  style: kLoginOrSignUpTextStyle(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ],
      );
}
