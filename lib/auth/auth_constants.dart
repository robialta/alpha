import 'package:alpha/common/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kLoginTitleStyle() => GoogleFonts.ubuntu(
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle() => GoogleFonts.ubuntu();

TextStyle kLoginTermsAndPrivacyStyle() =>
    GoogleFonts.ubuntu(fontSize: 12, color: Colors.grey, height: 1.5);

TextStyle kLoginOrSignUpTextStyle() => GoogleFonts.ubuntu(
      fontWeight: FontWeight.w500,
      color: primary,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);
