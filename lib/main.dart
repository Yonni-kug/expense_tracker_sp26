import 'package:expense_tracker_sp26/Widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ColorScheme kustomColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,DeviceOrientation.portraitDown
  // ]).then((fn) {

  runApp(MaterialApp(
    theme: ThemeData(textTheme: ThemeData().textTheme.copyWith( 
      titleLarge: TextStyle(
        fontWeight: FontWeight.normal,
        color: kustomColorScheme.onSecondaryContainer,
        fontSize: 20,
      ),
    ),
    colorScheme: kustomColorScheme,
      cardTheme: CardThemeData(
        color: kustomColorScheme.primaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kustomColorScheme.primaryContainer,
          foregroundColor: kustomColorScheme.onPrimaryContainer,
        ),
      ),
    ),
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kustomColorScheme,
      cardTheme: CardThemeData(
        color: kustomColorScheme.primaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kustomColorScheme.primaryContainer,
          foregroundColor: kustomColorScheme.onPrimaryContainer,
        ),
      ),
    ),
    home: Expenses(),
  ));
}

