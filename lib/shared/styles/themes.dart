import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ThemeData lightTheme = ThemeData(
//   primarySwatch: defaultColor,
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: const AppBarTheme(
//     titleSpacing: 20.0,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//       statusBarIconBrightness: Brightness.dark,
//     ),
//     backgroundColor: Colors.white,
//     elevation: 0.0,
//     titleTextStyle: TextStyle(
//       fontFamily: 'Jannah',
//       color: Colors.black,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ),
//     iconTheme: IconThemeData(
//       color: Colors.black,
//     ),
//   ),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: defaultColor,
//     unselectedItemColor: Colors.grey,
//     elevation: 20.0,
//     backgroundColor: Colors.white,
//   ),
//   textTheme: const TextTheme(
//     bodyLarge: TextStyle(
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600,
//       color: Colors.black,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 14.0,
//       fontWeight: FontWeight.w600,
//       color: Colors.black,
//       height: 1.3,
//     ),
//   ),
//   fontFamily: 'Jannah',
// );

// ThemeData darkTheme = ThemeData(
//   primarySwatch: defaultColor,
//   scaffoldBackgroundColor: HexColor('333739'),
//   appBarTheme: AppBarTheme(
//     titleSpacing: 20.0,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: HexColor('333739'),
//       statusBarIconBrightness: Brightness.light,
//     ),
//     backgroundColor: HexColor('333739'),
//     elevation: 0.0,
//     titleTextStyle: const TextStyle(
//       fontFamily: 'Jannah',
//       color: Colors.white,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//     ),
//     iconTheme: const IconThemeData(
//       color: Colors.white,
//     ),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: defaultColor,
//     unselectedItemColor: Colors.grey,
//     elevation: 20.0,
//     backgroundColor: HexColor('333739'),
//   ),
//   textTheme: const TextTheme(
//     bodyLarge: TextStyle(
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 14.0,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//       height: 1.3,
//     ),
//   ),
//   fontFamily: 'Jannah',
// );

ThemeData getLightTheme = ThemeData(
  // primaryColor: Colors.white,
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     elevation: 0, foregroundColor: Colors.white),
  // brightness: Brightness.light,
  // colorScheme: const ColorScheme.light(
  //   primary: Color(0xff24A86B),
  //   onPrimary: Color(0xff38CA87),
  //   onSurface: Colors.black,
  //   primaryContainer: Color(0xff8B9199),
  //   secondary: Color(0xffF1F6F9),
  //   surface: Color(0xffEEFFF7),
  //   background: Colors.white,
  //   onBackground: Colors.black,
  //   secondaryContainer: Colors.white,
  // ),
  // iconTheme: IconThemeData(color: Colors.black),
  // textTheme: GoogleFonts.ibmPlexSansTextTheme(
  //   TextTheme(
  //     displayLarge: GoogleFonts.ibmPlexSans(
  //         fontSize: 22.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.3),
  //     displayMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 24.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.3),
  //     displaySmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 26.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.3),
  //     headlineMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 28.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.3),
  //     headlineSmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 30.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.4),
  //     titleLarge: GoogleFonts.ibmPlexSans(
  //         fontSize: 32.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.4),
  //     titleSmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 20.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.2),
  //     titleMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 18.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.2),
  //     bodyMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 16.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //         height: 1.2),
  //     bodyLarge: GoogleFonts.ibmPlexSans(
  //         fontSize: 14.0,
  //         fontWeight: FontWeight.w400,
  //         color: Colors.black,
  //         height: 1.2),
  //     bodySmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 12.0,
  //         fontWeight: FontWeight.w400,
  //         color: Colors.grey,
  //         height: 1.2),
  //   ),
  // ),
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black, size: 25),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    selectedIconTheme: IconThemeData(
      size: 26,
    ),
    selectedLabelStyle: TextStyle(fontSize: 19, color: Colors.deepOrange),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    elevation: 20.0,
  ),
  primaryTextTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),

  colorScheme: const ColorScheme.light(
      onBackground: Colors.black, background: Colors.white),
);

ThemeData getDarkTheme = ThemeData(
  // primaryColor: Colors.white,
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     elevation: 0, foregroundColor: Colors.white),
  // brightness: Brightness.light,
  // colorScheme: const ColorScheme.light(
  //   primary: Color(0xff24A86B),
  //   onPrimary: Color(0xff38CA87),
  //   onSurface: Colors.black,
  //   primaryContainer: Color(0xff8B9199),
  //   secondary: Color(0xff506680),
  //   surface: Color(0xff506680),
  //   background: Color(0xff081b33),
  //   onBackground: Colors.white,
  //   secondaryContainer: Color(0xff2F4562),
  // ),
  // iconTheme: IconThemeData(color: Colors.white),
  // textTheme: GoogleFonts.ibmPlexSansTextTheme(
  //   TextTheme(
  //     displayLarge: GoogleFonts.ibmPlexSans(
  //         fontSize: 22.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.3),
  //     displayMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 24.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.3),
  //     displaySmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 26.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.3),
  //     headlineMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 28.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.3),
  //     headlineSmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 30.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.4),
  //     titleLarge: GoogleFonts.ibmPlexSans(
  //         fontSize: 32.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.4),
  //     titleSmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 20.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.2),
  //     titleMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 18.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.2),
  //     bodyMedium: GoogleFonts.ibmPlexSans(
  //         fontSize: 16.0,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.2),
  //     bodyLarge: GoogleFonts.ibmPlexSans(
  //         fontSize: 14.0,
  //         fontWeight: FontWeight.w400,
  //         color: Colors.white,
  //         height: 1.2),
  //     bodySmall: GoogleFonts.ibmPlexSans(
  //         fontSize: 12.0,
  //         fontWeight: FontWeight.w400,
  //         color: Colors.grey,
  //         height: 1.2),
  //   ),
  // ),
  scaffoldBackgroundColor: const Color(0xff333739),
  primarySwatch: Colors.deepOrange,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white, size: 30),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff333739),
      statusBarIconBrightness: Brightness.light,
    ),
    color: Color(0xff333739),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xff333739),
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    selectedIconTheme: IconThemeData(
      size: 26,
    ),
    selectedLabelStyle: TextStyle(fontSize: 19, color: Colors.deepOrange),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme.dark(
      onBackground: Colors.white, background: Colors.black),
);
