import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'Detail/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFe49b0e),
        primaryColorLight: const Color(0xFFFBEE6),
        // accentColor: const Color(0xFF1B1F32),
      ),
      home: const HomePage(),
    );
  }
}
