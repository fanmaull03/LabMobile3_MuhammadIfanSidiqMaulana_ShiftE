import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pert3/screens/about_screen.dart';
import 'package:tugas_pert3/screens/login_screen.dart';
import 'package:tugas_pert3/screens/review_screen.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeProvider.isDarkMode
                ? ThemeData.dark().copyWith(
                    primaryColor: Colors.cyan,
                    colorScheme: ColorScheme.dark(
                      primary: Colors.cyan,
                      secondary: Colors.blueAccent,
                    ),
                  )
                : ThemeData.light().copyWith(
                    primaryColor: Colors.blue,
                    colorScheme: ColorScheme.light(
                      primary: Colors.blue,
                      secondary: Colors.cyan,
                    ),
                  ),
            initialRoute: '/login',
            routes: {
              '/': (context) => HomeScreen(),
              '/login': (context) => LoginScreen(),
              '/settings': (context) => SettingsScreen(),
              '/review': (context) => ReviewScreen(),
              '/about': (context) => AboutScreen(),
            },
          );
        },
      ),
    );
  }
}
