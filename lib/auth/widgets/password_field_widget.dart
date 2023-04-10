import 'package:alpha/auth/auth_constants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key,
      required this.passwordController,
      required this.validator,
      required this.hitnText});
  final TextEditingController passwordController;
  final String? Function(String? value) validator;
  final String hitnText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: kTextFormFieldStyle(),
        controller: widget.passwordController,
        obscureText: isObsecureText,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(Icons.lock_open),
          suffixIcon: IconButton(
            icon:
                Icon(isObsecureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                isObsecureText = !isObsecureText;
              });
            },
          ),
          hintText: widget.hitnText,
        ),
        // The validator receives the text that the user has entered.
        validator: widget.validator

        // (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter password';
        //   } else if (value.length < 7) {
        //     return 'At least enter 6 characters';
        //   }
        //   return null;
        // },
        );
  }
}
