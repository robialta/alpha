// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'colors.dart';

// ThemeData lightMode(BuildContext context) => ThemeData(
//       fontFamily: 'SpaceGrotesk',
//       drawerTheme: const DrawerThemeData(backgroundColor: grey100),
//       listTileTheme: const ListTileThemeData(iconColor: Colors.white),
//       dialogBackgroundColor: grey100,
//       brightness: Brightness.light,
//       // scaffoldBackgroundColor: grey100,
//       bottomNavigationBarTheme:
//           const BottomNavigationBarThemeData(backgroundColor: grey100),
//       appBarTheme: const AppBarTheme(
//         color: grey100,
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         fillColor: Colors.white,
//         hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
//         // filled: true,
//         iconColor: Colors.white,
//         enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(15)),
//         border: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.white),
//             borderRadius: BorderRadius.circular(15)),
//       ),
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       colorScheme: ColorScheme.fromSwatch(
//         primarySwatch: const MaterialColor(
//           0xFF106AF3,
//           {
//             50: primary,
//             100: primary,
//             200: primary,
//             300: primary,
//             400: primary,
//             500: primary,
//             600: primary,
//             700: primary,
//             800: primary,
//             900: primary,
//           },
//         ),
//       ).copyWith(
//         background: grey100,
//       ),
//       textTheme: GoogleFonts.ubuntuTextTheme().apply(bodyColor: Colors.white),
//     );

// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: grey1100,
//   bottomNavigationBarTheme:
//       const BottomNavigationBarThemeData(backgroundColor: grey1000),
//   appBarTheme: const AppBarTheme(
//     color: grey1100,
//     systemOverlayStyle: SystemUiOverlayStyle.light,
//   ),
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
//       .copyWith(background: grey1100),
// );
